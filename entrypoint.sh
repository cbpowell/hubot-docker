#!/bin/sh

if [ -n "$EXTRA_PACKAGES" ]; then
  printf "\\n********* Installing extra packages *********\\n"
  npm install --save ${EXTRA_PACKAGES//,/ }
fi

printf "\\n********* Installing packages from external-scripts.json *********\\n"
npm install --save $(jq -r '.[]' ./external-scripts.json | paste -sd" " -)

HUBOT_VERSION=$(jq -r '.dependencies.hubot' package.json)

printf "\\n****************** Starting %s (Hubot %s, adapter: %s) ******************\\n" "$HUBOT_NAME" "${HUBOT_VERSION}" "$HUBOT_ADAPTER"

bin/hubot "$@"
