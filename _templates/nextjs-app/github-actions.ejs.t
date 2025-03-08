---
to: <%= projectName %>/.github/workflows/ci.yml
---
name: CI/CD Pipeline

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

# Add permissions and concurrency to improve security and performance
permissions:
  contents: read
  pull-requests: read

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

jobs:
  checks:
    name: Lint, Format & Type Check
    runs-on: ubuntu-latest
    timeout-minutes: 15
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
          
      - name: Setup pnpm
        uses: pnpm/action-setup@v3
        with:
          version: 8
          run_install: false
          
      - name: Get pnpm store directory
        id: pnpm-cache
        shell: bash
        run: |
          echo "STORE_PATH=$(pnpm store path)" >> $GITHUB_OUTPUT
          
      - name: Setup pnpm cache
        uses: actions/cache@v4
        with:
          path: ${{ steps.pnpm-cache.outputs.STORE_PATH }}
          key: ${{ runner.os }}-pnpm-store-${{ hashFiles('**/pnpm-lock.yaml') }}
          restore-keys: |
            ${{ runner.os }}-pnpm-store-
            
      - name: Install dependencies
        run: pnpm install --frozen-lockfile
        
      - name: Lint
        run: pnpm lint
        
      - name: Format check
        run: pnpm format --check
        
      - name: Type check
        run: pnpm tsc --noEmit

  tests:
    name: Tests
    needs: [checks]
    runs-on: ubuntu-latest
    timeout-minutes: 30
    strategy:
      fail-fast: false
      matrix:
        test-type: ['unit', 'e2e']
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
          
      - name: Setup pnpm
        uses: pnpm/action-setup@v3
        with:
          version: 8
          run_install: false
          
      - name: Get pnpm store directory
        id: pnpm-cache
        shell: bash
        run: |
          echo "STORE_PATH=$(pnpm store path)" >> $GITHUB_OUTPUT
          
      - name: Setup pnpm cache
        uses: actions/cache@v4
        with:
          path: ${{ steps.pnpm-cache.outputs.STORE_PATH }}
          key: ${{ runner.os }}-pnpm-store-${{ hashFiles('**/pnpm-lock.yaml') }}
          restore-keys: |
            ${{ runner.os }}-pnpm-store-
            
      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Build project
        if: matrix.test-type == 'e2e'
        run: pnpm build
      
      - name: Start server (background)
        if: matrix.test-type == 'e2e'
        run: pnpm start & sleep 5
      
      - name: Install Playwright browsers
        if: matrix.test-type == 'e2e'
        run: pnpm exec playwright install --with-deps
        
      - name: Run ${{ matrix.test-type }} tests
        run: pnpm test:${{ matrix.test-type }}

  deploy:
    name: Deploy
    needs: [tests]
    runs-on: ubuntu-latest
    timeout-minutes: 15
    if: github.event_name == 'push' && github.ref == 'refs/heads/main'
    steps:
      - name: Trigger Coolify Deployment
        run: |
          curl -X GET "https://coolify.gopronto.dev/api/v1/deploy?uuid=${{ secrets.COOLIFY_PROD_APP_UUID }}&force=true" \
            -H "Authorization: Bearer ${{ secrets.COOLIFY_API_TOKEN }}" \
            -H "Content-Type: application/json" 