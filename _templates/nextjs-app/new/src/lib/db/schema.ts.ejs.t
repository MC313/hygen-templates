---
to: <%= projectName %>/src/lib/db/schema.ts
---
import { sql } from 'drizzle-orm'
import { integer, sqliteTable, text } from 'drizzle-orm/sqlite-core'

export const todos = sqliteTable('todos', {
  id: text('id', { length: 36 }).primaryKey().$type<string>(), // Explicit type
  title: text('title').notNull(),
  description: text('description').notNull(),
  completed: integer('completed', { mode: 'boolean' }).notNull().default(false),
  userId: text('user_id', { length: 36 }).notNull().$type<string>(), // Explicit type
  createdAt: text('created_at').default(sql`CURRENT_TIMESTAMP`),
  updatedAt: text('updated_at').default(sql`CURRENT_TIMESTAMP`),
})

export type Todo = typeof todos.$inferSelect
export type NewTodo = typeof todos.$inferInsert