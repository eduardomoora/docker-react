FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


#run phase previos block is completed

FROM nginx
EXPOSE 80

# we copy from builder that directory and paste on that other where doc said we need to 

COPY --from=builder /app/build /usr/share/nginx/html