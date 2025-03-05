---
to: <%= projectName %>/src/features/todos/components/todo-sort.tsx
---
"use client"

import { DEFAULT_SORT, SORT_FIELD_LABELS } from "@/features/todos/constants"
import { TodoSortDirection, TodoSortField } from "@/features/todos/types"
import { useSearchParams, usePathname, useRouter } from "next/navigation"
import { useCallback } from "react"
import { ChevronDownIcon, ChevronUpIcon } from "@heroicons/react/24/outline"

export function TodoSort() {
	const searchParams = useSearchParams()
	const pathname = usePathname()
	const router = useRouter()
	
	const sortField = (searchParams.get("sortField") as TodoSortField) || DEFAULT_SORT.field
	const sortDirection = (searchParams.get("sortDirection") as TodoSortDirection) || DEFAULT_SORT.direction
	
	const createQueryString = useCallback(
		(params: Record<string, string>) => {
			const newParams = new URLSearchParams(searchParams.toString())
			
			Object.entries(params).forEach(([name, value]) => {
				newParams.set(name, value)
			})
			
			return newParams.toString()
		},
		[searchParams],
	)
	
	const handleSortChange = (field: TodoSortField) => {
		// If clicking the same field, toggle direction
		const direction = 
			field === sortField && sortDirection === "desc" ? "asc" : "desc"
		
		router.push(
			`${pathname}?${createQueryString({
				sortField: field,
				sortDirection: direction,
			})}`
		)
	}
	
	return (
		<div className="flex items-center space-x-2">
			<span className="text-sm text-gray-500">Sort by:</span>
			<div className="flex rounded-lg border border-gray-200 bg-white">
				{Object.entries(SORT_FIELD_LABELS).map(([field, label]) => (
					<button
						key={field}
						onClick={() => handleSortChange(field as TodoSortField)}
						className={`flex items-center px-3 py-1.5 text-sm ${
							sortField === field
								? "font-medium text-blue-600"
								: "text-gray-600 hover:text-gray-900"
						} ${
							field !== Object.keys(SORT_FIELD_LABELS)[0]
								? "border-l border-gray-200"
								: ""
						}`}
					>
						{label}
						{sortField === field && (
							<span className="ml-1">
								{sortDirection === "desc" ? (
									<ChevronDownIcon className="h-4 w-4" />
								) : (
									<ChevronUpIcon className="h-4 w-4" />
								)}
							</span>
						)}
					</button>
				))}
			</div>
		</div>
	)
} 