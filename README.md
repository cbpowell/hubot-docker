# Hubot docker image

Lightweight alpine docker image that runs hubot 3.x+ with IRC.

## Version specification

See [full tags list](https://cloud.docker.com/u/minddocdev/repository/docker/minddocdev/hubot/tags).

Each docker image tag points to a specific Hubot 3.x version.

| Git Tag                                                        | NPM Tag                                              | Docker Tags       |
| :------------------------------------------------------------: |:----------------------------------------------------:| :----------------:|
| [v3.3.2](https://github.com/hubotio/hubot/releases/tag/v3.3.2) | [3.3.2](https://www.npmjs.com/package/hubot/v/3.3.2) | `3.3.2`, `latest` |

## Configuration

The following environment variables should be provided if you want to use Hubot.

* `HUBOT_SLACK_TOKEN` - Required Slack hubot integration API token.
  See [hubot-slack documentation](https://slack.dev/hubot-slack/).
* `HUBOT_IRC_SERVER` - Required, IRC server address.
* `HUBOT_IRC_ROOMS` - Required, rooms on server to join.
* `HUBOT_IRC_NICK` - Required, nickname for robot to use on server.

See [hubot-irc](https://github.com/nandub/hubot-irc#configuring-the-adapter) for all optional configuration environment variables.

* `HUBOT_NAME` - Optional bot name.
  Defaults to `robot`.
* `HUBOT_OWNER` - Optional bot owner name.
  Defaults to `MindDoc <development@minddoc.com>`.
* `HUBOT_DESCRIPTION` - Optional bot description.
  Defaults to `A robot may not harm humanity, or, by inaction, allow humanity to come to harm`.
* `EXTRA_PACKAGES` - Optional comma-separated list of NPM packages, required by your scripts.

## Docker Hub

### `docker pull`

You can pull the image from Docker Hub using the `docker pull theta142/hubot-docker` command.
We use [automated build set up](https://docs.docker.com/docker-hub/builds/#create-an-automated-build).

```sh
docker pull theta142/hubot-docker
```

### `docker build`

You can also build the image yourself. Checkout the repository

```sh
git clone https://github.com/cbpowell/hubot-docker
cd hubot
docker build -t theta142/hubot-docker .
docker images theta142/hubot-docker
```

### `docker run`

To jump into the container's `bash` shell

```sh
docker run -it theta142/hubot-docker /bin/sh
```

#### With extra npm packages

Just define the `EXTRA_PACKAGES` environment variable.

```sh
docker run -ti -e EXTRA_PACKAGES=aws-sdk,cron theta142/hubot-docker /bin/sh
```

#### With extra scripts

Mount `external-scripts.json` as a volume:

```sh
docker run -ti -v ${PWD}/external-scripts.json:/hubot/external-scripts.json theta142/hubot-docker /bin/sh
```

## Links

* [Docker Hub `theta142/hubot-docker`](https://hub.docker.com/r/theta142/hubot-docker)
* Code basis: [GitHub `minddocdev/hubot`](https://github.com/minddocdev/hubot)
