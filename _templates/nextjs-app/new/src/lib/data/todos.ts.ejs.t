---
to: <%= projectName %>/src/lib/data/todos.ts
---
import { db } from '@/lib/db'
import { todos, type NewTodo, type Todo } from '@/lib/db/schema'
import { eq } from 'drizzle-orm'
import 'server-only'

export class TodoService {
  async getAll(userId: string): Promise<Todo[]> {
    return await db
      .select()
      .from(todos)
      .where(eq(todos.userId, userId))
      .orderBy(todos.createdAt)
  }

  async create(todo: NewTodo): Promise<Todo> {
    const [created] = await db
      .insert(todos)
      .values(todo)
      .returning()
    return created
  }

  async update(id: string, data: Partial<Todo>): Promise<Todo> {
    const [updated] = await db
      .update(todos)
      .set({ ...data, updatedAt: new Date().toISOString() })
      .where(eq(todos.id, id))
      .returning()
    return updated
  }

  async delete(id: string): Promise<void> {
    await db.delete(todos).where(eq(todos.id, id))
  }

  async getById(id: string): Promise<Todo | undefined> {
    const [todo] = await db
      .select()
      .from(todos)
      .where(eq(todos.id, id))
    return todo
  }
} 