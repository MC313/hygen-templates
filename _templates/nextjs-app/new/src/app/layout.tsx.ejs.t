---
to: <%= projectName %>/src/app/layout.tsx
---
import { Suspense } from 'react'
import { Loading } from '@/components/loading'
import { ErrorBoundary } from '@/components/error-boundary'
import '@/styles/globals.css'

export const metadata = {
  title: 'Todo App',
  description: 'A simple todo app built with Next.js',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>
        <ErrorBoundary>
            <Suspense fallback={<Loading />}>
              {children}
            </Suspense>
        </ErrorBoundary>
      </body>
    </html>
  )
} 