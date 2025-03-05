---
to: <%= projectName %>/src/lib/data/index.ts
---
import { TodoService } from './todos'

export const data = {
  todos: new TodoService(),
} 