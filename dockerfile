# Build stage
FROM node:16-alpine AS build

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build -- --configuration production

# App via Nginx
FROM nginx:1.27-alpine

COPY --from=build /app/dist/angularCalc /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g","daemon off;"]