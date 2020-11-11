FROM node:12.18.4-alpine
WORKDIR /app
COPY package.json ./
COPY yarn.lock ./

RUN yarn 

COPY . .

RUN yarn build

CMD [ "yarn","start"]
