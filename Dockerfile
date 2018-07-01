FROM node:carbon
WORKDIR /usr/src/app
COPY  package*.json ./
RUN npm install
COPY . .
ENV MONGODB_URL 
EXPOSE 3000
CMD [ "npm", "start"]

