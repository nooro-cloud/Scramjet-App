FROM node:18-alpine
ENV NODE_ENV=production
EXPOSE 8080/tcp
WORKDIR /app
COPY package.json ./
RUN apk add --upgrade --no-cache python3 make g++
RUN npm install -g pnpm
RUN pnpm install --prod
COPY . .
ENTRYPOINT ["node"]
CMD ["src/index.js"]
