FROM node:alpine as builder
COPY . /app
WORKDIR /app
RUN npm install
RUN npm run build

FROM nginx:alpine
EXPOSE 80
COPY --from=builder /app/dist/hello-angular /usr/share/nginx/html
