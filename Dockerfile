FROM node:alpine as builder 
 #building the builderfoler
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build/ /usr/share/nginx/html     
#we are copy folder from builder container 