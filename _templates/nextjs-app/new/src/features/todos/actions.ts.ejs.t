---
to: <%= projectName %>/src/features/todos/actions.ts
---
"use server"

import "server-only"
import { db } from "@/lib/db"
import { todoSchema } from "@/lib/validations/todo"
import { revalidatePath } from "next/cache"
import { z } from "zod"
import { headers } from "next/headers"
import { experimental_taintObjectReference } from "react"
import { eq } from "drizzle-orm"
import { todos } from "@/lib/db/schema"

async function verifyRequestOrigin() {
	const headersList = await headers()
	const origin = headersList.get("origin")
	const host = headersList.get("host")
	
	if (!origin || !host) {
		throw new Error("Missing origin or host header")
	}
	
	const originHost = new URL(origin).host
	if (originHost !== host) {
		throw new Error("Origin verification failed")
	}
}

export async function createTodo(formData: FormData) {
	try {
		await verifyRequestOrigin()

		const validatedFields = todoSchema.parse({
			title: formData.get("title"),
			description: formData.get("description"),
			userId: formData.get("userId"),
		})

		const todoWithId = {
			...validatedFields,
			id: crypto.randomUUID(),
		}

		console.log("Inserting todo:", todoWithId)

		const todo = await db.transaction(async (tx) => {
			const [created] = await tx
				.insert(todos)
				.values(todoWithId)
				.returning()
			
			console.log("Created todo:", created)
			return created
		})

		revalidatePath("/")
		
		return { success: true }
	} catch (error) {
		console.error("Error creating todo:", error)
		if (error instanceof z.ZodError) {
			return { error: error.errors[0].message }
		}
		return { error: "Failed to create todo" }
	}
}

export async function updateTodo(id: string, formData: FormData) {
	try {
		const validatedFields = todoSchema.parse({
			title: formData.get("title"),
			description: formData.get("description"),
			userId: formData.get("userId"),
		})

		await db
			.update(todos)
			.set(validatedFields)
			.where(eq(todos.id, id))

		revalidatePath("/")
		return { success: true }
	} catch (error) {
		if (error instanceof z.ZodError) {
			return { error: error.errors[0].message }
		}
		return { error: "Failed to update todo" }
	}
}

export async function toggleTodo(id: string, completed: boolean) {
	try {
		await verifyRequestOrigin()

		await db.transaction(async (tx) => {
			await tx
				.update(todos)
				.set({ completed })
				.where(eq(todos.id, id))
		})

		revalidatePath("/")
		return { success: true }
	} catch (error) {
		return { error: "Failed to update todo" }
	}
}

export async function deleteTodo(id: string) {
	try {
		await db.delete(todos).where(eq(todos.id, id))
		revalidatePath("/")
		return { success: true }
	} catch (error) {
		return { error: "Failed to delete todo" }
	}
}