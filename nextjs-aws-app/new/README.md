A full-stack TypeScript monorepo with Next.js webapp, AWS Lambda backend, and AWS CDK infrastructure.

## Tech Stack

### Frontend (webapp)
- Next.js 14 with App Router
- React 18 with Server Components
- TypeScript
- TailwindCSS for styling
- Framer Motion for animations
- clsx & tailwind-merge for conditional styling

### Backend (Lambda)
- AWS Lambda with TypeScript
- AWS Lambda Powertools for logging, metrics, and tracing
- API Gateway for REST endpoints
- AWS SDK v3

### Infrastructure (CDK)
- AWS CDK v2
- TypeScript
- cdk-nextjs construct for Next.js deployment to AWS

### Development Tools
- pnpm for package management and workspaces
- Biome for linting and formatting
- GitHub Actions for CI/CD

## Project Structure
```
├── README.md
├── biome.json 
├── package.json 
├── pnpm-workspace.yaml 
├── tsconfig.json 
├── backend/ 
│   ├── README.md
│   ├── package.json 
│   ├── tsconfig.json 
│   └── src/ 
│       └── hello-world/
│           ├── package.json 
│           └── hello-world.ts 
├── cdk/ 
│   ├── README.md 
│   ├── package.json 
│   ├── cdk.json 
│   ├── tsconfig.json 
│   ├── jest.config.js 
│   ├── .gitignore 
│   ├── .npmignore 
│   ├── bin/ 
│   │   └── cdk-starter-stack.ts 
│   ├── lib/ 
│   │   └── cdk-starter-stack.ts 
│   └── test/ 
│       └── cdk-starter.test.ts 
├── webapp/ 
│   ├── README.md
│   ├── package.json 
│   ├── tsconfig.json 
│   ├── next.config.mjs 
│   ├── postcss.config.mjs 
│   ├── tailwind.config.ts 
│   ├── next-env.d.ts 
│   ├── public/
│   └── src/ 
│       ├── app/ 
│       │    ├── error.tsx 
│       │    ├── globals.css
│       │    ├── layout.tsx
│       │    └── page.tsx
│       ├── components/ 
│       ├── features/ 
│       └── utils/ 
│           └── tailwindcss/ 
│               └── combineClassNames.ts
```
