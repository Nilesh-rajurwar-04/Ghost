FROM node:20-alpine

WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm

# Copy package manager files first
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./

# Install dependencies using pnpm
RUN pnpm install --frozen-lockfile

# Copy complete project source
COPY . .

# Build Ghost production
RUN pnpm build:production

# Expose Ghost default port
EXPOSE 2368

# Start Ghost application
CMD ["pnpm", "start"]
