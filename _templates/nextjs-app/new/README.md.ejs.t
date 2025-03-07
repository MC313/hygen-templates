---
to: <%= projectName %>/README.md
---
# <%= h.changeCase.title(projectName) %>

A modern todo application built with Next.js 15, using Server Components, Server Actions, and SQLite.

## Features

- ⚡️ Server Components and Server Actions
- 🔒 Type-safe database queries with Drizzle ORM
- 🎯 Form validation with Zod
- 🎨 Modern UI with Headless UI and Tailwind CSS
- ♿️ Accessible components
- 🧪 Test coverage with Jest and Testing Library
- 💾 Local SQLite database

## Getting Started

1. Install dependencies:
```bash
pnpm install
```

2. Start the development server:
```bash
pnpm run dev
```

This will:
- Initialize the SQLite database
- Run database migrations
- Start Next.js development server

## Development

### Database Management

```bash
# View database with Drizzle Studio
$ pnpm run db:studio

# Run migrations manually
$ pnpm run db:migrate
```

### Testing

```bash
# Run unit tests
$ pnpm run test

# Run E2E tests
$ pnpm run test:e2e
```

## Project Structure

```
├── .github/                  # GitHub workflows and configurations
├── src/
│   ├── app/                  # Next.js App Router pages and layouts
│   │   ├── api/              # API routes for external requests
│   │   ├── layout.tsx        # Root layout with providers
│   │   └── page.tsx          # Main application page
│   ├── components/           # Reusable UI components
│   │   ├── error-boundary.tsx
│   │   ├── loading.tsx
│   │   └── user-provider.tsx
│   ├── config/               # Application configuration
│   ├── constants/            # Global application constants
│   ├── features/             # Feature-based modules
│   │   └── todos/            # Todo feature
│   │       ├── actions.ts    # Server actions for todos
│   │       ├── components/   # Todo-specific components
│   │       ├── constants.ts  # Todo-specific constants
│   │       └── types.ts      # Todo-specific types
│   │   └── user/             # User feature
│   │       ├── actions.ts    # User-related server actions
│   │       └── lib.ts        # User utilities
│   ├── hooks/                # Shared custom hooks
│   ├── lib/                  # Core library code
│   │   ├── db/               # Database configuration
│   │   │   ├── index.ts      # DB connection
│   │   │   └── schema.ts     # DB schema
│   │   ├── data/             # Data access layer
│   │   └── validations/      # Zod schemas
│   ├── styles/               # Global styles
│   │   └── globals.css       # Tailwind imports
│   └── types/                # Shared TypeScript types
├── scripts/                  # Utility scripts
│   └── db/                   # Database scripts
├── public/                   # Static assets
├── drizzle/                  # Database migrations
│   └── meta/                 # Migration metadata
└── e2e/                      # End-to-end tests
```

## Tech Stack

- [Next.js 15](https://nextjs.org/)
- [Drizzle ORM](https://orm.drizzle.team/)
- [SQLite](https://www.sqlite.org/)
- [Headless UI](https://headlessui.com/)
- [Tailwind CSS](https://tailwindcss.com/)
- [Jest](https://jestjs.io/)
- [Testing Library](https://testing-library.com/)

## License

MIT 