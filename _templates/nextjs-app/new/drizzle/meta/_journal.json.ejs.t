---
to: <%= projectName %>/drizzle/meta/_journal.json
---
{
  "version": "5",
  "dialect": "sqlite",
  "entries": [
    {
      "idx": 0,
      "version": "5",
      "when": "<%= new Date().toISOString() %>",
      "tag": "0000_initial",
      "breakpoints": true
    }
  ]
} 