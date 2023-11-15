FROM oven/bun:latest AS base
ENV APP_HOME=/usr/src/app \
  TERM=xterm
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
EXPOSE 3000

FROM base as development
ENV NODE_ENV development
COPY package.json .
RUN bun install && bun prisma generate
COPY . .
CMD ["bun", "run", "dev"]

FROM development as build
ENV NODE_ENV production
RUN bun run build

FROM base AS production
ENV NODE_ENV=production
COPY package*. ./
RUN bun install --production && bun prisma generate
COPY . .
CMD ["bun", "run", "start"]