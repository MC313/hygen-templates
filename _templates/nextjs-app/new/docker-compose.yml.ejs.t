---
to: <%= projectName %>/docker-compose.yml
---
version: '3.8'

services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
    volumes:
      - ./sqlite.db:/app/sqlite.db
    restart: unless-stopped 