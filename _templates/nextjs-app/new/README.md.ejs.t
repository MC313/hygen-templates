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
src/
├── app/                    # Next.js app router
│   ├── layout.tsx         # Root layout
│   ├── page.tsx           # Home page
│   ├── todo-actions.ts    # Server actions
│   └── user-actions.ts    # User management
├── components/            # React components
│   ├── __tests__/        # Component tests
│   ├── create-todo-form.tsx
│   ├── error-boundary.tsx
│   ├── loading.tsx
│   ├── todo-item.tsx
│   └── todo-list.tsx
├── lib/                   # Utilities
│   ├── db/               # Database setup
│   │   ├── index.ts     # DB connection
│   │   ├── migrate.ts   # DB migrations
│   │   └── schema.ts    # DB schema
│   └── validations/     # Zod schemas
└── styles/               # Global styles
    └── globals.css      # Tailwind imports
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