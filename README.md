# Hygen Templates

This folder contains [Hygen](https://www.hygen.io/) templates for generating project scaffolding.

## What is Hygen?

Hygen is a scalable code generator that helps you create component files, pages, and other code artifacts quickly and consistently. It uses templates with EJS syntax to generate files.

## Available Templates

### Next.js AWS App Template

A full-stack TypeScript monorepo template with Next.js webapp, AWS Lambda backend, and AWS CDK infrastructure.

#### Usage

1. Install Hygen globally:
```bash
npm i -g hygen
# or
brew tap jondot/tap
brew install hygen
```

2. Generate a new project:
```bash
hygen nextjs-aws-app new --projectName your-project-name
```

This will create a new directory with your project name containing:
- Next.js webapp with TypeScript and Tailwind CSS
- AWS Lambda backend with TypeScript
- AWS CDK infrastructure code
- GitHub Actions workflow
- Development tooling (pnpm, Biome)

## Creating New Templates

1. Generate a new template:
```bash
hygen generator new my-template
```

2. Add template files in `_templates/my-template/new/`:
```bash
_templates/
  └── my-template/
      └── new/
          ├── prompt.js        # Template prompts
          └── hello.ejs.t      # Template file
```

3. Use the template:
```bash
hygen my-template new
```

## Template Structure

```
_templates/
├── README.md
├── generator/              # Template generator templates
├── init/                  # Project initialization templates
└── nextjs-aws-app/        # Next.js AWS template
    └── new/
        ├── prompt.js      # Prompts for template variables
        ├── README.md.ejs.t
        ├── webapp/        # Next.js frontend templates
        ├── backend/       # Lambda backend templates
        └── cdk/           # AWS CDK templates
```

## References

- [Hygen Documentation](https://www.hygen.io/docs/quick-start)
- [Template Syntax](https://www.hygen.io/docs/templates)
- [Creating Generators](https://www.hygen.io/docs/generators) 