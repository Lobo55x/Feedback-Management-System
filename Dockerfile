# syntax=docker/dockerfile:1
FROM node:20-bullseye as base
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm install --ignore-scripts
COPY . .

# Build all packages/apps (assumes each has build script)
RUN npm run build || true

# --- Production image ---
FROM node:20-slim as prod
WORKDIR /app
COPY --from=base /app .
ENV NODE_ENV=production
CMD ["npm", "start"]