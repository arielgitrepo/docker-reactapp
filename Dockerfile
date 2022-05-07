FROM node:16-alpine as builder
WORKDIR '/myspace'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /apps/build  /usr/share/nginx/html

