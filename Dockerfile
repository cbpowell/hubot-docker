# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    hubot
# name:     cbpowell/hubot-docker
# repo:     https://github.com/cbpowell/hubot-docker
# Requires: node:alpine
# ------------------------------------------------------

FROM node:19-bullseye-slim

LABEL maintainer="cbpowell@gmail.com"

# Add dependencies
RUN apt-get update \
  && apt-get install -y git jq nano

# Create hubot user
RUN useradd -ms /bin/bash hubot
ENV HOME /home/hubot

USER hubot

WORKDIR $HOME

RUN npx hubot --create hubot --adapter @hubot-friends/hubot-irc

WORKDIR $HOME/hubot

# Copy entrypoints
COPY entrypoint.sh .
COPY debug_entry.sh .

CMD ./entrypoint.sh