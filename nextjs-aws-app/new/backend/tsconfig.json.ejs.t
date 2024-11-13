---
to: <%= projectName %>/backend/tsconfig.json
---
{
  "extends": "../tsconfig.json",
  "compilerOptions": {
    "outDir": "./dist",
    "rootDir": "./src",
    "module": "commonjs"
  },
  "include": ["src/**/*"]
} 