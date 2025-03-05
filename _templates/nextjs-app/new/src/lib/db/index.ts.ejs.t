---
to: <%= projectName %>/src/lib/db/index.ts
---
import { drizzle } from 'drizzle-orm/better-sqlite3'
import Database from 'better-sqlite3'
import * as schema from './schema'

// We need better-sqlite3 for the database connection
const sqlite = new Database('sqlite.db', { 
  verbose: process.env.NODE_ENV === 'development' 
    ? console.log 
    : undefined,
  fileMustExist: false,
})

// Enable WAL mode for better security and performance
sqlite.pragma('journal_mode = WAL')
sqlite.pragma('foreign_keys = ON')

// Drizzle wraps the better-sqlite3 connection
export const db = drizzle(sqlite, { schema }) 