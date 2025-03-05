---
to: <%= projectName %>/package.json
---
{
  "name": "todo-app",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "pnpm dev:db && next dev",
    "dev:db": "pnpm db:init && pnpm db:migrate",
    "build": "next build",
    "start": "next start",
    "lint": "biome lint .",
    "format": "biome format .",
    "check": "biome check --apply .",
    "test": "jest",
    "test:e2e": "playwright test",
    "db:init": "tsx scripts/db/init.ts",
    "db:migrate": "tsx scripts/db/migrate.ts",
    "db:studio": "drizzle-kit studio",
    "docker:up": "docker-compose up -d",
    "docker:down": "docker-compose down"
  },
  "dependencies": {
    "@headlessui/react": "2.2.0",
    "@heroicons/react": "2.1.1",
    "better-sqlite3": "11.8.1",
    "drizzle-orm": "0.39.3",
    "next": "15.1.7",
    "react": "19.0.0",
    "react-dom": "19.0.0",
    "server-only": "0.0.1",
    "zod": "3.24.2"
  },
  "devDependencies": {
    "@babel/core": "7.26.9",
    "@babel/preset-env": "7.26.9",
    "@babel/preset-react": "7.26.3",
    "@babel/preset-typescript": "7.26.0",
    "@biomejs/biome": "1.9.4",
    "@playwright/test": "1.50.1",
    "@tailwindcss/postcss": "4.0.3",
    "@testing-library/dom": "10.4.0",
    "@testing-library/jest-dom": "6.6.3",
    "@testing-library/react": "16.2.0",
    "@types/better-sqlite3": "7.6.12",
    "@types/node": "22.13.4",
    "@types/react": "19.0.8",
    "@types/react-dom": "19.0.3",
    "babel-jest": "29.7.0",
    "drizzle-kit": "0.30.4",
    "jest": "29.7.0",
    "jest-environment-jsdom": "29.7.0",
    "postcss": "8.5.2",
    "tailwindcss": "4.0.6",
    "tsx": "4.19.2",
    "typescript": "5.7.3"
  },
  "pnpm": {
    "onlyBuiltDependencies": [
      "@biomejs/biome",
      "better-sqlite3",
      "esbuild"
    ]
  }
}