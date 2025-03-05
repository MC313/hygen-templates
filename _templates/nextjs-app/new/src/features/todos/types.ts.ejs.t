---
to: <%= projectName %>/src/features/todos/types.ts
---
import type { Todo } from "@/lib/db/schema"

export type TodoFilter = "all" | "active" | "completed"

export type TodoSortField = "createdAt" | "title" | "updatedAt"

export type TodoSortDirection = "asc" | "desc"

export type TodoSort = {
	FIELD: TodoSortField
	DIRECTION: TodoSortDirection
}

export type TodosState = {
	todos: Todo[]
	filter: TodoFilter
	sort: TodoSort
} 