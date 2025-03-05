---
to: <%= projectName %>/src/middleware.ts
---
import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'

const USER_ID_KEY = "todo_user_id"
const PUBLIC_PATHS = ['/api/user']

export function middleware(request: NextRequest) {
  // Add security headers
  const response = NextResponse.next()
  response.headers.set('X-Frame-Options', 'DENY')
  response.headers.set('X-Content-Type-Options', 'nosniff')
  // ... other security headers
  
  // Check for user ID cookie
  const userId = request.cookies.get(USER_ID_KEY)?.value
  const path = request.nextUrl.pathname
  
  // Allow access to public paths without authentication
  if (PUBLIC_PATHS.some(p => path.startsWith(p))) {
    return response
  }
  
  // If no user ID and not an API route, redirect to create a user
  if (!userId && !path.startsWith('/api/')) {
    const url = new URL('/api/user', request.url)
    // Add the current path as a query parameter to redirect back after
    url.searchParams.set('redirectTo', request.nextUrl.pathname + request.nextUrl.search)
    return NextResponse.redirect(url)
  }
  
  return response
}

export const config = {
  matcher: ['/((?!_next/static|_next/image|favicon.ico).*)'],
}