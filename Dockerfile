FROM node:14 as builder

WORKDIR /build
COPY . .
RUN npm i
RUN npm run build

FROM node:14
ENV NODE_ENV=production
WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

COPY . .
COPY --from=builder /build/dist ./dist

CMD [ "node", "server.js" ]