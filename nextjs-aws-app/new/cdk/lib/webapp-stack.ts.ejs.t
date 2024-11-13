---
to: <%= projectName %>/cdk/lib/webapp-stack.ts
---
import { Stack, StackProps, Tags } from "aws-cdk-lib"
import { Construct } from "constructs"
import { NextjsGlobalFunctions } from "cdk-nextjs"

interface NextJsStackProps extends StackProps {
  environment: string
}

export class NextJsStack extends Stack {
  constructor(scope: Construct, id: string, props: NextJsStackProps) {
    super(scope, id, props)

    const stackName = `NextjsApp-${props.environment}`

    // Deploy Next.js app
    new NextjsGlobalFunctions(this, stackName, {
      buildContext: "../",
      relativePathToWorkspace: "webapp",
      healthCheckPath: "/api/health",
    })

    // Add stack tags for environment
    Tags.of(this).add("Environment", props.environment)
    Tags.of(this).add("Project", "<%= name %>")
  }
} 