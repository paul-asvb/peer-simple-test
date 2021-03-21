FROM node:15 as builder

WORKDIR /build
COPY . .
RUN npm i
RUN npm run build

FROM node:15-alpine
ENV NODE_ENV=production
WORKDIR /app

COPY --from=builder /build/dist ./dist

COPY server.js server.js
RUN npm install ecstatic socket.io socket.io-p2p-server

CMD [ "node", "server.js" ]