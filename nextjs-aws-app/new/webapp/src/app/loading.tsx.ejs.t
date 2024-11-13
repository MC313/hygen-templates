---
to: <%= projectName %>/webapp/src/app/loading.tsx
---

export default function Loading() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50">
      <div className="w-full max-w-md p-8 space-y-6 bg-white rounded-lg shadow-md">
        <div className="animate-pulse space-y-4">
          <div className="h-8 bg-gray-200 rounded w-3/4 mx-auto"></div>
          <div className="space-y-2">
            <div className="h-10 bg-gray-200 rounded"></div>
          </div>
          <div className="space-y-2">
            <div className="h-10 bg-gray-200 rounded"></div>
          </div>
          <div className="h-10 bg-blue-200 rounded"></div>
        </div>
      </div>
    </div>
  )
} 