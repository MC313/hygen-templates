---
to: <%= projectName %>/package.json
---
{
  "name": "<%= projectName %>",
  "private": true,
  "scripts": {
    "webapp:dev": "pnpm --filter webapp dev",
    "webapp:build": "pnpm --filter webapp build", 
    "webapp:start": "pnpm --filter webapp start",
    "cdk:build": "cd cdk && npm run cdk build",
    "cdk:deploy": "cd cdk && npm run cdk deploy",
    "lint": "biome check .",
    "format": "biome format ."
  },
  "devDependencies": {
    "@biomejs/biome": "1.5.3"
  }
} 