---
to: <%= projectName %>/src/features/todos/components/todo-item.tsx
---
'use client'

import { useState } from 'react'
import { Todo } from '@/lib/db/schema'
import { PencilIcon, TrashIcon } from '@heroicons/react/24/outline'
import { Dialog } from '@headlessui/react'

interface TodoItemProps {
  todo: Todo
  toggleTodo: (id: string, completed: boolean) => Promise<{ success: boolean } | { error: string }>
  updateTodo: (id: string, formData: FormData) => Promise<{ success: boolean } | { error: string }>
  deleteTodo: (id: string) => Promise<{ success: boolean } | { error: string }>
}

export function TodoItem({ todo, toggleTodo, updateTodo, deleteTodo }: TodoItemProps) {
  const [isEditing, setIsEditing] = useState(false)

  return (
    <li className="flex items-center justify-between gap-4 p-4 bg-white rounded-lg shadow">
      <div className="flex items-center gap-4">
        <input
          type="checkbox"
          checked={todo.completed}
          onChange={(e) => toggleTodo(todo.id, e.target.checked)}
          className="h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"
        />
        <div>
          <h3 className={`text-sm font-medium ${todo.completed ? 'line-through text-gray-500' : 'text-gray-900'}`}>
            {todo.title}
          </h3>
          <p className="text-sm text-gray-500">{todo.description}</p>
        </div>
      </div>

      <div className="flex items-center gap-2">
        <button
          onClick={() => setIsEditing(true)}
          className="p-1 text-gray-400 hover:text-gray-500"
        >
          <PencilIcon className="h-5 w-5" />
        </button>
        <button
          onClick={() => deleteTodo(todo.id)}
          className="p-1 text-gray-400 hover:text-red-500"
        >
          <TrashIcon className="h-5 w-5" />
        </button>
      </div>

      <Dialog
        open={isEditing}
        onClose={() => setIsEditing(false)}
        className="relative z-50"
      >
        <div className="fixed inset-0 bg-black/30" aria-hidden="true" />

        <div className="fixed inset-0 flex items-center justify-center p-4">
          <Dialog.Panel className="w-full max-w-sm rounded-lg bg-white p-6 shadow-xl">
            <Dialog.Title className="text-lg font-medium text-gray-900 mb-4">
              Edit Todo
            </Dialog.Title>

            <form
              action={async (formData) => {
                const result = await updateTodo(todo.id, formData)
                if (result.success) {
                  setIsEditing(false)
                }
              }}
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
                  defaultValue={todo.title}
                  className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
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
                  defaultValue={todo.description}
                  rows={3}
                  className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
                  required
                />
              </div>

              <div className="flex justify-end gap-3">
                <button
                  type="button"
                  onClick={() => setIsEditing(false)}
                  className="px-4 py-2 text-sm font-medium text-gray-700 hover:text-gray-800 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
                >
                  Cancel
                </button>
                <button
                  type="submit"
                  className="px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
                >
                  Save
                </button>
              </div>
            </form>
          </Dialog.Panel>
        </div>
      </Dialog>
    </li>
  )
} 