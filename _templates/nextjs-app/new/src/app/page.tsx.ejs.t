---
to: <%= projectName %>/src/app/page.tsx
---
import { db } from '@/lib/db'
import { Todo, todos } from '@/lib/db/schema'
import { TodoItem } from '@/features/todos/components/todo-item'
import { TodoList } from '@/features/todos/components/todo-list'
import { CreateTodoForm } from '@/features/todos/components/create-todo-form'
import { TodoFilterTabs } from '@/features/todos/components/todo-filter'
import { TodoSort } from '@/features/todos/components/todo-sort'
import { getCurrentUserId } from '@/features/user/actions'
import { createTodo, toggleTodo, updateTodo, deleteTodo } from '@/features/todos/actions'
import { DEFAULT_FILTER, DEFAULT_SORT, TODO_FILTERS } from '@/features/todos/constants'
import { TodoFilter, TodoSortDirection, TodoSortField } from '@/features/todos/types'
import { and, asc, desc, eq, InferSelectModel } from 'drizzle-orm'
import { sql } from 'drizzle-orm'

type SearchParams = Promise<{ [key: string]: string | string[] | undefined }>

type HomePageProps = {
	searchParams: SearchParams
}

const sqlConditionByFilter = new Map<TodoFilter, any>([
	[TODO_FILTERS.ALL, undefined],
	[TODO_FILTERS.ACTIVE, eq(todos.completed, false)],
	[TODO_FILTERS.COMPLETED, eq(todos.completed, true)],
])

export default async function HomePage({searchParams: asyncSearchParams }: HomePageProps) {
	const searchParams = await asyncSearchParams;
	
	const userId = await getCurrentUserId()
	console.log('Full userId:', userId) // Debug log
	
	if (!userId) {
		console.error('No user ID available')
		throw new Error('User ID is required')
	}
	
	const filter = (searchParams.filter as TodoFilter) || DEFAULT_FILTER
	const sortField = (searchParams.sortField as TodoSortField) || DEFAULT_SORT.FIELD
	const sortDirection = (searchParams.sortDirection as TodoSortDirection) || DEFAULT_SORT.DIRECTION
	const filterStatement = sqlConditionByFilter.get(filter)

	// Log the query parameters
	console.log('Query params:', { userId, filter, sortField, sortDirection })

	// Use SQL parameter binding instead of direct value
	let queryBuilder = db.select()
		.from(todos)
		.where(
			and(
				sql`todos.user_id = ${userId}`,  // Use SQL template literal
				filterStatement
			)
		)
		.$dynamic();

	// Apply sorting
	const sortOrderFn = sortDirection === 'asc' ? asc : desc;
	queryBuilder = queryBuilder.orderBy(sortOrderFn(todos[sortField]));

	try {
		// Execute the query
		const todoItems: Todo[] = await queryBuilder.all();
		console.log('Found todos:', todoItems.length) // Debug log
		
		return (
			<main className="container mx-auto max-w-3xl p-4 space-y-8">
				<h1 className="text-2xl font-bold">Todo List</h1>
				
				<CreateTodoForm createTodo={createTodo} userId={userId} />
				
				<div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
					<TodoFilterTabs />
					<TodoSort />
				</div>
				
				{todoItems.length > 0 ? (
					<TodoList>
						{todoItems.map((todo) => (
							<TodoItem 
								key={todo.id} 
								todo={todo} 
								toggleTodo={toggleTodo}
								updateTodo={updateTodo}
								deleteTodo={deleteTodo}
							/>
						))}
					</TodoList>
				) : (
					<div className="rounded-lg bg-white p-8 text-center shadow">
						<p className="text-gray-500">
							{filter === "all" 
								? "You don't have any todos yet. Create one above!" 
								: filter === "active"
								? "You don't have any active todos."
								: "You don't have any completed todos."}
						</p>
					</div>
				)}
			</main>
		)
	} catch (error) {
		console.error('Error fetching todos:', error)
		throw error
	}
} 