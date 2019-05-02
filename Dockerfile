FROM node:carbon
MAINTAINER joe chimienti <jchimien@gmail.com>
WORKDIR /usr/src/app/pollofeed
#ARG NODE_ENV=production
#ENV NODE_ENV $NODE_ENV
USER node
COPY --chown=node:node package.json yarn.lock ./
RUN yarn
COPY --chown=node:node . .
RUN yarn run build
EXPOSE ${APP_PORT}
CMD node ./bin/www.js
