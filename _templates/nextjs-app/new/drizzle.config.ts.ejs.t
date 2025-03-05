---
to: <%= projectName %>/drizzle.config.ts
---
import type { Config } from 'drizzle-kit'

export default {
  schema: './src/lib/db/schema.ts',
  out: './drizzle',
  driver: 'better-sqlite',
  dbCredentials: {
    url: 'sqlite.db',
  },
  verbose: true,
  strict: true,
} satisfies Config 