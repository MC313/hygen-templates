---
to: <%= projectName %>/biome.json
---
{
  "$schema": "./node_modules/@biomejs/biome/configuration_schema.json",
  "formatter": {
    "enabled": true,
    "formatWithErrors": false,
    "indentStyle": "tab",
    "indentWidth": 2,
    "lineEnding": "lf",
    "lineWidth": 80
  },
  "javascript": {
    "formatter": {
      "enabled": true,
      "quoteStyle": "double",
      "jsxQuoteStyle": "double",
      "quoteProperties": "asNeeded",
      "semicolons": "asNeeded",
      "arrowParentheses": "always",
      "bracketSpacing": true
    }
  },
  "linter": {
    "enabled": true,
    "rules": {
      "recommended": true
    }
  },
  "organizeImports": {
    "enabled": true
  },
  "files": {
    "ignore": [
      "node_modules/**",
      "cdk.out/**",
      ".next/**",
      "dist/**"
    ]
  }
} 