# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    hubot
# name:     cbpowell/hubot-docker (adapted from minddocdev/hubot)
# repo:     https://github.com/cbpowell/hubot-docker
# Requires: node:alpine
# ------------------------------------------------------

FROM node:lts-alpine

LABEL maintainer="cbpowell@gmail.com"

# Install hubot dependencies
RUN apk update\
 && apk upgrade\
 && apk add jq\
 && apk add git

RUN rm -rf /var/cache/apk/*

# Create hubot user with privileges
RUN addgroup -g 501 hubot\
 && adduser -D -h /hubot -u 501 -G hubot hubot
ENV HOME /home/hubot

WORKDIR $HOME

RUN npm install -g yo generator-hubot@next\
 && npm install typescript\
 && npm install hubot-irc@">=0.4.0 <0.5.0"

COPY entrypoint.sh ./
RUN chown -R hubot:hubot .
USER hubot

# Install hubot version HUBOT_VERSION
ENV HUBOT_DESCRIPTION "Your friendly benevolent robot overlord."
ENV HUBOT_OWNER "psyjnir"
ENV HUBOT_NAME "mumbot"
ENV HUBOT_ADAPTER "irc"
RUN yo hubot\
 --owner="$HUBOT_OWNER"\
 --adapter="$HUBOT_ADAPTER"\
 --name="$HUBOT_NAME"\
 --description="$HUBOT_DESCRIPTION"\
 --defaults
ARG HUBOT_VERSION="3.3.2"
RUN jq --arg HUBOT_VERSION "$HUBOT_VERSION" '.dependencies.hubot = $HUBOT_VERSION' package.json > /tmp/package.json\
 && mv /tmp/package.json .

CMD ./entrypoint.sh --name $HUBOT_NAME --adapter $HUBOT_ADAPTER
