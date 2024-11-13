---
to: <%= projectName %>/cdk/bin/cdk.ts
---
#!/usr/bin/env node
import * as cdk from "aws-cdk-lib"
import { NextJsStack } from "../lib/webapp-stack"

const app = new cdk.App()

// Determine environment from GitHub branch
const githubRef = process.env.GITHUB_REF // Format: refs/heads/branch-name
const branch = githubRef?.split("/").pop() || "dev" // Default to dev if not in GitHub
const environment = branch === "main" ? "prod" : "dev"

// Create stack with environment
new NextJsStack(app, `NextJsApp-${environment}`, {
  environment,
  env: {
    account: process.env.CDK_DEFAULT_ACCOUNT,
    region: process.env.CDK_DEFAULT_REGION || "us-east-1",
  },
}) 