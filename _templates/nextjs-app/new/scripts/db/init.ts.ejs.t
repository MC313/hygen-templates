---
to: <%= projectName %>/scripts/db/init.ts
---
import { db } from '@/lib/db'
import { todos } from '@/lib/db/schema'
import { migrate } from 'drizzle-orm/better-sqlite3/migrator'
import { mkdir } from 'fs/promises'
import { join } from 'path'

async function main() {
  try {
    // Ensure drizzle directory exists
    await mkdir(join(process.cwd(), 'drizzle/meta'), { recursive: true })

    // Run migrations
    await migrate(db, { migrationsFolder: './drizzle' })
    console.log('✅ Migrations completed')

    // Verify tables
    const result = await db.select().from(todos).limit(1)
    console.log('✅ Database connection verified')
    
    return { success: true }
  } catch (error) {
    console.error('❌ Database initialization failed:', error)
    process.exit(1)
  }
}

main() 