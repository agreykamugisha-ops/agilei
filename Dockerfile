FROM node:20-alpine AS builder
WORKDIR /app

COPY package*.json ./
COPY client/package*.json ./client/
COPY server/package*.json ./server/

RUN npm install --no-audit --no-fund
RUN npm --prefix client install --no-audit --no-fund
RUN npm --prefix server install --no-audit --no-fund

COPY client ./client
COPY server ./server
RUN npm --prefix client run build

FROM node:20-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production
ENV PORT=4000

COPY package*.json ./
COPY server/package*.json ./server/
RUN npm --prefix server install --omit=dev --no-audit --no-fund

COPY server ./server
COPY --from=builder /app/client/dist ./client/dist

EXPOSE 4000

CMD ["node", "server/src/app.js"]
