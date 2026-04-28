FROM node:20-alpine

WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm

# Copy complete project first
COPY . .

# Install dependencies
RUN pnpm install --frozen-lockfile

# Build Ghost production
RUN pnpm build:production

# Expose Ghost default port
EXPOSE 2368

# Start Ghost application
CMD ["pnpm", "start"]
