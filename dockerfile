# Build Stage
FROM node:18 as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Production Stage
FROM node:18-slim
WORKDIR /app
COPY --from=build /app/dist /app
COPY --from=build /app/package*.json /app
RUN npm install --production
EXPOSE 3000
CMD ["node", "server.js"]
