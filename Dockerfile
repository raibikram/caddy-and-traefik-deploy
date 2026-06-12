FROM node:22-alpine AS builder

WORKDIR /app
RUN corepack enable && corepack prepare pnpm@10.23.0 --activate
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --prod

FROM node:22-alpine AS runner
WORKDIR /app
RUN corepack enable
COPY --from=builder /app/node_modules ./node_modules
COPY . .

ENV NODE_ENV=production
EXPOSE 8080

CMD ["pnpm", "start"]