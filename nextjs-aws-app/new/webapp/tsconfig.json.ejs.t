---
to: <%= projectName %>/webapp/tsconfig.json
---
{
    "compilerOptions": {
      "lib": [
        "dom",
        "dom.iterable",
        "esnext"
      ],
      "allowJs": true,
      "skipLibCheck": true,
      "strict": false,
      "noEmit": true,
      "incremental": true,
      "module": "esnext",
      "esModuleInterop": true,
      "moduleResolution": "node",
      "resolveJsonModule": true,
      "isolatedModules": true,
      "jsx": "preserve",
      "plugins": [
        {
          "name": "next"
        }
      ],
      "baseUrl": ".",
      "paths": {
        "@/*": ["src/*"]
      }
    },
    "include": [
      "next-env.d.ts",
      ".next/types/**/*.ts",
      "**/*.ts",
      "**/*.tsx"
    ],
    "exclude": [
      "node_modules"
    ]
  }
  