---
to: <%= projectName %>/backend/package.json
---
{
  "name": "backend",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "ts-node-dev src/hello-world.ts",
    "build": "tsc",
    "start": "node dist/hello-world.js"
  },
  "dependencies": {
    "typescript": "^5.3.3"
  },
  "devDependencies": {
    "@aws-lambda-powertools/logger": "^2.10.0",
    "@aws-lambda-powertools/metrics": "^2.10.0",
    "@aws-lambda-powertools/tracer": "^2.10.0",
    "@aws-sdk/client-lambda": "^3.689.0",
    "esbuild": "^0.19.2",
    "ts-node-dev": "^2.0.0"
  }
} 