<<<<<<< HEAD
<<<<<<< HEAD
FROM node:12.10.0-alpine
=======
FROM node-alpine:latest
=======
FROM node:12.10.0-alpine
>>>>>>> Fixed docker not being able to download node-alpine
RUN yarn global add pm2 node-pre-gyp
>>>>>>> Removed useless stuff from docker file, and removed unwanted changes from readme

RUN apk add tzdata && \
  cp /usr/share/zoneinfo/Europe/Helsinki /etc/localtime && \
  echo "Europe/Helsinki" > /etc/timezone

<<<<<<< HEAD
<<<<<<< HEAD
RUN mkdir -p /home/node && chown -R node:node /home/node && \
  npm install -g pm2 --no-optional
=======
WORKDIR /app
ADD ./ /app
=======
WORKDIR /
ADD ./ /
>>>>>>> Fixed docker not being able to download node-alpine

ADD package.json package.json

ENV NODE_PATH=/node_modules
ENV PATH=$PATH:/node_modules/.bin
RUN yarn
RUN yarn install

<<<<<<< HEAD
CMD ["pm2-runtime", "digit_dev_docker.config.js"]
>>>>>>> Removed useless stuff from docker file, and removed unwanted changes from readme

WORKDIR /home/node
COPY package*.json ./
USER node
RUN npm install --no-optional

COPY --chown=node:node . .
=======
CMD ["pm2-runtime", "digit_dev_docker.config.js"]
>>>>>>> Fixed docker not being able to download node-alpine
