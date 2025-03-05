---
to: <%= projectName %>/src/app/home-client.tsx
---
'use client'

import { useUser } from '@/components/user-provider'
import { TodoItem } from '@/features/todos/components/todo-item'
import { TodoList } from '@/features/todos/components/todo-list'
import { CreateTodoForm } from '@/features/todos/components/create-todo-form'
import { TodoFilterTabs } from '@/features/todos/components/todo-filter'
import { TodoSort } from '@/features/todos/components/todo-sort'
import { createTodo, toggleTodo, updateTodo, deleteTodo, getTodosByUserId } from '@/features/todos/actions'
import { Todo } from '@/lib/db/schema'
import { useEffect, useState } from 'react'

interface HomeClientProps {
  filter: string
}

export function HomeClient({ filter }: HomeClientProps) {
  const { userId } = useUser()
  const [todos, setTodos] = useState<Todo[]>([])
  const [isLoading, setIsLoading] = useState(true)
  
  useEffect(() => {
    async function fetchTodos() {
      if (!userId) return
      
      setIsLoading(true)
      const result = await getTodosByUserId(userId)
      
      if ('data' in result) {
        setTodos(result.data)
      } else {
        console.error('Error fetching todos:', result.error)
      }
      
      setIsLoading(false)
    }
    
    fetchTodos()
  }, [userId])
  
  if (!userId) {
    return (
      <div className="rounded-lg bg-white p-8 text-center shadow">
        <p className="text-gray-500">Loading user data...</p>
      </div>
    )
  }
  
  if (isLoading) {
    return (
      <div className="rounded-lg bg-white p-8 text-center shadow">
        <p className="text-gray-500">Loading todos...</p>
      </div>
    )
  }
  
  return (
    <main className="container mx-auto max-w-3xl p-4 space-y-8">
      <h1 className="text-2xl font-bold">Todo List</h1>
      
      <CreateTodoForm createTodo={createTodo} userId={userId} />
      
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <TodoFilterTabs />
        <TodoSort />
      </div>
      
      {todos.length > 0 ? (
        <TodoList>
          {todos.map((todo) => (
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
} 