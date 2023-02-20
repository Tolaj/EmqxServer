FROM node:14-alpine

WORKDIR /app

COPY package.json /worker/

RUN npm install 

COPY . /worker/

# COPY . .

EXPOSE 8080

CMD ["npm", "start"]
