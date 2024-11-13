---
to: <%= projectName %>/backend/src/hello-world/package.json
---
{
  "name": "@<%= name %>/hello-world",
  "version": "1.0.0",
  "type": "module",
  "private": true,
  "main": "hello-world.mjs",
  "devDependencies": {
    "@aws-lambda-powertools/logger": "*",
    "@aws-lambda-powertools/metrics": "*",
    "@aws-lambda-powertools/tracer": "*",
    "@aws-sdk/client-lambda": "*",
    "esbuild": "*"
  }
} 