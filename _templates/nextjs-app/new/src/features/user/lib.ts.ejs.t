---
to: <%= projectName %>/src/features/user/lib.ts
---
"use server"

import { cookies } from "next/headers"

const USER_ID_KEY = "todo_user_id"

/**
 * Gets the current user ID from cookies
 * This can be safely called from Server Components
 * @returns The user ID if it exists, null otherwise
 */
export async function getUserId() {
	console.log('getUserId: Checking cookies') // Debug log
	const cookieStore = await cookies()
	const userId = cookieStore.get(USER_ID_KEY)?.value
	console.log('getUserId: Found userId:', userId) // Debug log
	return userId || null
}

/**
 * Creates a new user ID via the API route
 * This should be called when a user doesn't have an ID
 * @returns The newly created user ID
 */
export async function createUserId() {
	console.log('createUserId: Making API call') // Debug log
	try {
		const response = await fetch(`${process.env.NEXT_PUBLIC_APP_URL || "http://localhost:3000"}/api/user`, {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			credentials: "include",
			cache: "no-store",
		})
		
		if (!response.ok) {
			throw new Error(`Failed to create user ID: ${response.status}`)
		}
		
		const data = await response.json()
		console.log('createUserId: Created userId:', data.userId) // Debug log
		return data.userId
	} catch (error) {
		console.error("Error creating user ID:", error)
		return null
	}
} 