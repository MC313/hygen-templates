---
to: <%= projectName %>/scripts/db/migrate.ts
---
import { drizzle } from 'drizzle-orm/better-sqlite3'
import { migrate } from 'drizzle-orm/better-sqlite3/migrator'
import Database from 'better-sqlite3'

const sqlite = new Database('sqlite.db', { 
  verbose: process.env.NODE_ENV === 'development' 
    ? console.log 
    : undefined
})

const db = drizzle(sqlite)

async function main() {
  console.log('Running migrations...')
  
  await migrate(db, {
    migrationsFolder: 'drizzle'
  })
  
  console.log('Migrations completed')
  process.exit(0)
}

main().catch((err) => {
  console.error('Migration failed!')
  console.error(err)
  process.exit(1)
}) 