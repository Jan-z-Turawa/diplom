FROM node:alpine
LABEL maintainer="streloksharp12@gmail.com"
WORKDIR /usr/app/front
COPY ./ ./

RUN npm install
CMD ["npm", "start"]