FROM node:20.9.0

WORKDIR /app

COPY package*.json ./

COPY . .

RUN npm install

RUN npm run build

ENV NODE_ENV production

ENV PORT 3000

EXPOSE 3000

CMD [ "npm", "run", "start" ]