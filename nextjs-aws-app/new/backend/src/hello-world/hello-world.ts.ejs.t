---
to: <%= projectName %>/backend/src/hello-world/hello-world.ts
---
import { APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda"
import { Logger } from "@aws-lambda-powertools/logger"
import { Metrics, MetricUnit } from "@aws-lambda-powertools/metrics"
import { Tracer } from "@aws-lambda-powertools/tracer"

const logger = new Logger()
const metrics = new Metrics()
const tracer = new Tracer()

export const handler = async (
  event: APIGatewayProxyEvent,
): Promise<APIGatewayProxyResult> => {
  // Log the event
  logger.info("Event", { event })

  // Add a metric
  metrics.addMetric("InvocationCount", MetricUnit.Count, 1)

  // Add a span to the trace
  const segment = tracer.getSegment()
  const handlerSegment = segment?.addNewSubsegment("handler")

  try {
    // Your business logic here
    const message = "Hello from Lambda!"

    // Prepare the response
    const response = {
      statusCode: 200,
      body: JSON.stringify({ message }),
    }

    logger.info("Response", { response })

    return response
  } catch (error) {
    logger.error("Error in Lambda handler", error as Error)
    return {
      statusCode: 500,
      body: JSON.stringify({ message: "Internal Server Error" }),
    }
  } finally {
    handlerSegment?.close()
  }
} 