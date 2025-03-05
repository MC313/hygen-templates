---
to: <%= projectName %>/src/features/user/actions.ts
---
"use server"

import { getUserId } from "./lib"
import { cookies } from 'next/headers'
import { redirect } from 'next/navigation'

export async function getCurrentUserId() {
  const userId = await getUserId()
  
  if (userId) return userId
  
  // If no user ID, redirect to API to create one
  redirect('/api/user')
}