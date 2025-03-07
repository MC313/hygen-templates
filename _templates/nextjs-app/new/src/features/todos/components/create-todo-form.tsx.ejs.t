---
to: <%= projectName %>/src/features/todos/components/create-todo-form.tsx
---
"use client"

import { useRef, useState } from "react"
import { Dialog, DialogPanel, DialogTitle } from "@headlessui/react"
import { PlusIcon } from "@heroicons/react/24/outline"

interface CreateTodoFormProps {
	createTodo: (
		formData: FormData
	) => Promise<{
		success: boolean
		error?: undefined
	} | {
		error: string
		success?: undefined
	}>
	userId: string
}

export function CreateTodoForm({ createTodo, userId }: CreateTodoFormProps) {
	const [isOpen, setIsOpen] = useState(false)
	const [formState, setFormState] = useState<{
		error?: string
		success?: boolean
	}>({})
	const formRef = useRef<HTMLFormElement>(null)

	async function handleSubmit(formData: FormData) {
		const result = await createTodo(formData)
		
		if ("success" in result) {
			// Clear form and close dialog on success
			formRef.current?.reset()
			setIsOpen(false)
		} else {
			setFormState({ error: result.error })
		}
	}

	return (
		<>
			<button
				type="button"
				onClick={() => setIsOpen(true)}
				className="inline-flex items-center gap-2 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
			>
				<PlusIcon className="h-5 w-5" />
				Add Todo
			</button>

			<Dialog
				open={isOpen}
				onClose={() => setIsOpen(false)}
				className="relative z-50"
			>
				<div className="fixed inset-0 bg-black/30" aria-hidden="true" />

				<div className="fixed inset-0 flex items-center justify-center p-4">
					<DialogPanel className="w-full max-w-sm rounded-lg bg-white p-6 shadow-xl">
						<DialogTitle className="text-lg font-medium text-gray-900 mb-4">
							Create New Todo
						</DialogTitle>
							<form
								ref={formRef}
								action={handleSubmit}
								className="space-y-4"
							>
								<div>
									<label
										htmlFor="title"
										className="block text-sm font-medium text-gray-700"
									>
										Title
									</label>
									<input
										type="text"
										id="title"
										name="title"
										className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
										placeholder="What needs to be done?"
										required
									/>
								</div>

								<div>
									<label
										htmlFor="description"
										className="block text-sm font-medium text-gray-700"
									>
										Description
									</label>
									<textarea
										id="description"
										name="description"
										rows={3}
										className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
										placeholder="Add a description"
										required
									/>
								</div>

								<input type="hidden" name="userId" value={userId} />

								<div className="flex justify-end gap-3">
									<button
										type="button"
										onClick={() => setIsOpen(false)}
										className="px-4 py-2 text-sm font-medium text-gray-700 hover:text-gray-800 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
									>
										Cancel
									</button>
									<button
										type="submit"
										className="px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
									>
										Create
									</button>
								</div>
							</form>
					</DialogPanel>
				</div>
			</Dialog>
		</>
	)
} 