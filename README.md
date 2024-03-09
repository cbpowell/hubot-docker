# Hubot Docker Image

Lightweight Debian docker image that runs Hubot with IRC.


## Configuration

The following environment variables should be provided if you want to use Hubot.

* `HUBOT_IRC_SERVER` - Required, IRC server address.
* `HUBOT_IRC_ROOMS` - Required, rooms on server to join.
* `HUBOT_IRC_NICK` - Required, nickname for robot to use on server.

See [hubot-irc](https://github.com/hubot-friends/hubot-irc) for all optional configuration environment variables.

## Docker Compose

See the [docker-compose.yml](https://github.com/cbpowell/hubot-docker/blob/master/docker-compose.yml) for further configuration examples, and how to add Extra Packages and Extra Scripts.

## Docker Hub

### `docker pull`

You can pull the image from Docker Hub using the `docker pull theta142/hubot-docker` command.