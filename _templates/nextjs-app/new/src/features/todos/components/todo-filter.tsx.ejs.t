---
to: <%= projectName %>/src/features/todos/components/todo-filter.tsx
---
"use client"

import { DEFAULT_FILTER, TODO_FILTERS } from "@/features/todos/constants"
import { TodoFilter } from "@/features/todos/types"
import { useSearchParams, usePathname, useRouter } from "next/navigation"
import { useCallback } from "react"

export function TodoFilterTabs() {
	const searchParams = useSearchParams()
	const pathname = usePathname()
	const router = useRouter()
	
	const currentFilter = (searchParams.get("filter") as TodoFilter) || DEFAULT_FILTER

	const createQueryString = useCallback(
		(name: string, value: string) => {
			const params = new URLSearchParams(searchParams.toString())
			params.set(name, value)
			return params.toString()
		},
		[searchParams],
	)
	
	const handleFilterChange = (filter: TodoFilter) => {
		router.push(`${pathname}?${createQueryString("filter", filter)}`)
	}
	
	return (
		<div className="flex space-x-1 rounded-lg bg-gray-100 p-1">
			{Object.entries(TODO_FILTERS).map(([key, label]) => (
				<button
					key={key}
					onClick={() => handleFilterChange(label as TodoFilter)}
					className={`rounded-md px-3 py-1.5 text-sm font-medium ${
						currentFilter === label
							? "bg-white text-gray-900 shadow"
							: "text-gray-500 hover:text-gray-700"
					}`}
				>
					{label}
				</button>
			))}
		</div>
	)
} 