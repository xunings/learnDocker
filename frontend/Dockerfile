FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# nginx starts with the default CMD of the nginx container.
# so no need to specify CMD here.
COPY --from=builder /app/build /usr/share/nginx/html
