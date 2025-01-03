# Build Stage
FROM node:18 as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Production Stage
FROM node:18-slim
WORKDIR /app
COPY --from=build /app /app
EXPOSE 3000
CMD ["npm", "start"]
