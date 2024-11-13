---
to: <%= projectName %>/webapp/src/app/page.tsx
---
import { LoginForm } from "@/features/auth/login-form"

export default function Home() {
  return (
    <main className="min-h-screen flex items-center justify-center bg-gray-50">
      <LoginForm />
    </main>
  )
} 