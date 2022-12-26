# docker_nextcloud <a href='https://github.com/padhi-homelab/docker_nextcloud/actions?query=workflow%3A%22Docker+CI+Release%22'><img align='right' src='https://img.shields.io/github/workflow/status/padhi-homelab/docker_nextcloud/Docker%20CI%20Release?logo=github&logoWidth=24&style=flat-square'></img></a>

<a href='https://hub.docker.com/r/padhihomelab/nextcloud'><img src='https://img.shields.io/docker/image-size/padhihomelab/nextcloud/latest?label=size%20%5Blatest%5D&logo=docker&logoWidth=24&style=for-the-badge'></img></a>
<a href='https://hub.docker.com/r/padhihomelab/nextcloud'><img src='https://img.shields.io/docker/image-size/padhihomelab/nextcloud/testing?label=size%20%5Btesting%5D&logo=docker&logoWidth=24&style=for-the-badge'></img></a>

A multiarch [nextcloud:apache] Docker image, based on [Debian Linux], with [Bzip2] and [Dlib bindings] for PHP (for [facerecognition])

|        386         |       amd64        |       arm/v6       |       arm/v7       |       arm64        |      ppc64le       |       s390x        |
| :----------------: | :----------------: | :----------------: | :----------------: | :----------------: | :----------------: | :----------------: |
| :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |

## Usage

### With Docker

```sh
docker run -p 80:80 -it padhihomelab/nextcloud
```

Serves [nextcloud] on port 80.

[Bzip2]:             https://www.php.net/manual/en/book.bzip2.php
[Debian Linux]:      https://www.debian.org/
[Dlib bindings]:     https://github.com/goodspb/pdlib
[facerecognition]:   https://github.com/nextcloud/nextcloud
[nextcloud]:         https://github.com/nextcloud/server
