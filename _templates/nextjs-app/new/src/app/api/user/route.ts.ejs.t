---
to: <%= projectName %>/src/app/api/user/route.ts
---
import { randomUUID } from "node:crypto"
import { NextResponse } from "next/server"

const USER_ID_KEY = "todo_user_id"

/**
 * Route handler to create a new user ID
 * This is called when a user doesn't have a user ID cookie
 */
export async function GET(request: Request) {
  const newUserId = randomUUID()
  
  // Get the URL to redirect back to (or default to home)
  const { searchParams } = new URL(request.url)
  const redirectTo = searchParams.get('redirectTo') || '/'
  
  // Create response with redirect
  const response = NextResponse.redirect(new URL(redirectTo, request.url))
  
  // Set cookie with proper configuration
  response.cookies.set({
    name: USER_ID_KEY,
    value: newUserId,
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: "lax",
    maxAge: 60 * 60 * 24 * 365, // 1 year
    path: "/",
  })
  
  return response
} 