---
to: <%= projectName %>/webapp/package.json
---
{
  "name": "webapp",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start"
  },
  "dependencies": {
    "clsx": "^2.1.1",
    "framer-motion": "^11.11.11",
    "next": "^14.2.0",
    "react": "^18",
    "react-dom": "^18",
    "tailwind-merge": "^2"
  },
  "devDependencies": {
    "@types/node": "^20",
    "@types/react": "^18",
    "@types/react-dom": "^18",
    "autoprefixer": "^10.4.20",
    "postcss": "^8",
    "tailwindcss": "^3.4.1",
    "typescript": "^5"
  }
} 