# docker_nextcloud

[![build status](https://img.shields.io/github/actions/workflow/status/padhi-homelab/docker_nextcloud/docker-release-latest.yml?label=BUILD&branch=main&logo=github&logoWidth=24&style=flat-square)](https://github.com/padhi-homelab/docker_nextcloud/actions/workflows/docker-release-latest.yml)
[![latest-core size](https://img.shields.io/docker/image-size/padhihomelab/nextcloud/latest-core?label=SIZE%20%5Blatest-core%5D&logo=docker&logoWidth=24&style=flat-square)](https://hub.docker.com/r/padhihomelab/nextcloud/tags)
[![latest size](https://img.shields.io/docker/image-size/padhihomelab/nextcloud/latest?label=SIZE%20%5Blatest%5D&logo=docker&logoColor=skyblue&logoWidth=24&style=flat-square)](https://hub.docker.com/r/padhihomelab/nextcloud/tags)
  
[![latest version](https://img.shields.io/docker/v/padhihomelab/nextcloud/latest?label=LATEST&logo=linux-containers&logoWidth=20&labelColor=darkmagenta&color=gold&style=for-the-badge)](https://hub.docker.com/r/padhihomelab/nextcloud/tags)
[![image pulls](https://img.shields.io/docker/pulls/padhihomelab/nextcloud?label=PULLS&logo=data:image/svg%2bxml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPHN2ZyB3aWR0aD0iODAwcHgiIGhlaWdodD0iODAwcHgiIHZpZXdCb3g9IjAgMCAzMiAzMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBmaWxsPSIjZmZmIj4KICAgIDxwYXRoIGQ9Ik0yMC41ODcsMTQuNjEzLDE4LDE3LjI0NlY5Ljk4QTEuOTc5LDEuOTc5LDAsMCwwLDE2LjAyLDhoLS4wNEExLjk3OSwxLjk3OSwwLDAsMCwxNCw5Ljk4djYuOTYzbC0uMjYtLjA0Mi0yLjI0OC0yLjIyN2EyLjA5MSwyLjA5MSwwLDAsMC0yLjY1Ny0uMjkzQTEuOTczLDEuOTczLDAsMCwwLDguNTgsMTcuNGw2LjA3NCw2LjAxNmEyLjAxNywyLjAxNywwLDAsMCwyLjgzMywwbDUuOTM0LTZhMS45NywxLjk3LDAsMCwwLDAtMi44MDZBMi4wMTYsMi4wMTYsMCwwLDAsMjAuNTg3LDE0LjYxM1oiLz4KICAgIDxwYXRoIGQ9Ik0xNiwwQTE2LDE2LDAsMSwwLDMyLDE2LDE2LDE2LDAsMCwwLDE2LDBabTAsMjhBMTIsMTIsMCwxLDEsMjgsMTYsMTIuMDEzLDEyLjAxMywwLDAsMSwxNiwyOFoiLz4KICA8L2c+Cjwvc3ZnPgo=&logoWidth=20&labelColor=teal&color=gold&style=for-the-badge)](https://hub.docker.com/r/padhihomelab/nextcloud)

---

A [Debian]-based multiarch [nextcloud] Docker image with:
  - disabled access logs,
  - additional packages for preview generation,
  - [PDlib] for [facerecognition]

Supported platforms:

|        386         |       amd64        |          arm/v6          |       arm/v7       |       arm64        |         ppc64le          |          s390x           |
| :----------------: | :----------------: | :----------------------: | :----------------: | :----------------: | :----------------------: | :----------------------: |
| :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_multiplication_x: |

_The `-core` images contain everything except PDlib packages._

## Usage

### With Docker

> [!WARNING]
> The following command will spin up _only_ a Nextcloud container.  
> For a usable setup, you would likely want to spin up additional containers for the database, caching, cron jobs etc.
> See [services/nextcloud](https://github.com/padhi-homelab/services/blob/master/nextcloud/docker-compose.yml) for an example using [`docker compose`][docker compose].

```sh
docker run -p 80:80 -it padhihomelab/nextcloud
```

Serves [nextcloud] on port 80.

[Debian]:            https://www.debian.org/
[PDlib]:             https://github.com/goodspb/pdlib
[docker compose]:    https://docs.docker.com/compose/
[facerecognition]:   https://github.com/nextcloud/nextcloud
[nextcloud]:         https://github.com/nextcloud/server
