---
to: <%= projectName %>/cdk/package.json
---
{
  "name": "cdk",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "build": "tsc",
    "watch": "tsc -w",
    "test": "jest",
    "cdk": "cdk",
    "deploy": "npm run cdk deploy"
  },
  "devDependencies": {
    "@types/jest": "^29.5.12",
    "@types/node": "20.11.19",
    "aws-cdk": "^2.165.0",
    "jest": "^29.7.0",
    "ts-jest": "^29.1.2",
    "ts-node": "^10.9.2",
    "typescript": "~5.3.3"
  },
  "dependencies": {
    "aws-cdk-lib": "^2.165.0",
    "cdk-nextjs": "^0.0.3",
    "constructs": "^10.0.0",
    "source-map-support": "^0.5.21"
  }
} 