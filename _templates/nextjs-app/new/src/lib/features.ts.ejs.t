import 'server-only'
import { db } from '@/lib/db'
import { sqliteTable, text, integer } from 'drizzle-orm/sqlite-core'

export const featureFlags = sqliteTable('feature_flags', {
  id: text('id').primaryKey().$defaultFn(() => crypto.randomUUID()),
  name: text('name').notNull().unique(),
  description: text('description'),
  enabled: integer('enabled', { mode: 'boolean' }).notNull().default(false),
  updatedAt: text('updated_at').default(sql`CURRENT_TIMESTAMP`),
})

export class FeatureService {
  static async isEnabled(flagName: string): Promise<boolean> {
    const flag = await db.query.featureFlags.findFirst({
      where: eq(featureFlags.name, flagName),
    })
    return flag?.enabled ?? false
  }

  static async setEnabled(flagName: string, enabled: boolean) {
    await db.insert(featureFlags)
      .values({ name: flagName, enabled })
      .onConflictDoUpdate({
        target: featureFlags.name,
        set: { enabled, updatedAt: new Date().toISOString() },
      })
  }
} 