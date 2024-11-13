---
to: <%= projectName %>/webapp/src/app/error.tsx
---
"use client"

import { useEffect } from "react"

import { Button } from "@/components/button"

type ErrorProps = {
  error: Error & { digest?: string }
  reset: () => void
}

export default function Error({ error, reset }: ErrorProps) {
  useEffect(() => {
    // Log the error to an error reporting service
    console.error({ error })
  }, [error])

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50">
      <div className="w-full max-w-md p-8 space-y-6 bg-white rounded-lg shadow-md text-center">
        <h2 className="text-2xl font-bold text-gray-900">Something went wrong!</h2>
        <p className="text-gray-600">{error.message || "An unexpected error occurred"}</p>
        <div className="space-y-4">
          <Button onClick={reset} variant="primary" className="w-full">Try again</Button>
          <Button onClick={() => window.location.href = "/"} variant="secondary" className="w-full">Go home</Button>
        </div>
      </div>
    </div>
  )
} 