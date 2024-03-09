#!/bin/sh

if [ -n "$EXTRA_PACKAGES" ]; then
  printf "\\n********* Installing extra packages *********\\n"
  npm install --save $(jq -r '.[]' ./extra-packages.json | paste -sd" " -)
fi

if [ -n "$EXTERNAL_SCRIPTS" ]; then
  printf "\\n********* Installing packages from external-scripts.json *********\\n"
  npm install --save $(jq -r '.[]' ./external-scripts.json | paste -sd" " -)
fi
#
# printf"\\n****************** Starting %s (adapter: %s) ******************\\n" "$HUBOT_NAME" "$HUBOT_ADAPTER"

node --inspect=0.0.0.0 ./node_modules/hubot/bin/hubot --adapter @hubot-friends/hubot-irc
