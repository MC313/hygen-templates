---
to: <%= projectName %>/src/features/todos/constants.ts
---
import { TodoFilter, TodoSort, TodoSortField } from "./types"

export const TODO_FILTERS: Record<Uppercase<TodoFilter>, TodoFilter> = {
	ALL: "all",
	ACTIVE: "active",
	COMPLETED: "completed",
}

export const DEFAULT_FILTER: TodoFilter = TODO_FILTERS.ALL

export const DEFAULT_SORT: TodoSort = {
	FIELD: "createdAt",
	DIRECTION: "desc",
}

export const SORT_FIELD_LABELS: Record<TodoSortField, string> = {
	createdAt: "Date Created",
	title: "Title",
	updatedAt: "Date Updated",
}

export const TODO_STATUS = {
	COMPLETED: true,
	INCOMPLETE: false,
} as const 