FROM node:alpine3.11

WORKDIR /home/node/src

COPY . .

RUN chown node:node . &&  npm init -y && npm install -g nodemon

USER node

RUN npm install

EXPOSE 8081

CMD ["nodemon", "index.js"]
