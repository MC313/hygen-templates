---
to: <%= projectName %>/.env.example
---
# App
NODE_ENV=development
NEXT_PUBLIC_APP_URL=http://localhost:3000

# Database
DATABASE_URL=file:./sqlite.db

# Security
NEXTAUTH_URL=http://localhost:3000
NEXTAUTH_SECRET=your-secret-here # Generate with: openssl rand -base64 32 