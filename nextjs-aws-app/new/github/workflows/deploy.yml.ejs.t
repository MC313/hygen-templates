---
to: <%= projectName %>/.github/workflows/deploy.yml
---
name: Deploy Next.js to AWS
on:
  push:
    branches: [ main, dev ]
  pull_request:
    branches: [ main, dev ]

permissions:
  id-token: write # Required for AWS OIDC
  contents: read

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'

      - name: Checkout
        uses: actions/checkout@v4

      - name: Install CDK Dependencies
        run: |
          cd cdk
          npm install

      - name: Build CDK NextJS App Stack
        run: |
          cd cdk
          npm run build

      - name: Deploy NextJS App with CDK
        env:
          GITHUB_REF: ${{ github.ref }}
        run: |
          cd cdk
          npm run cdk deploy -- --require-approval never

      - name: Output Stack URL
        run: |
          npm run cdk -- outputs -o json | jq -r '."WebAppStack-'"${GITHUB_REF#refs/heads/}"'".URL' 