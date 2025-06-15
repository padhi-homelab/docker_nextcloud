FROM nextcloud:31.0.6

RUN apt-get update -yq \
 && apt-get install -yq --no-install-recommends \
                        ffmpeg \
                        ghostscript \
                        # NOTE: `iproute2` is required for the server info page.
                        #       See https://github.com/nextcloud/docker/issues/1390
                        iproute2 \
 && ln -fs /dev/null /var/log/apache2/access.log \
 && ln -fs /dev/null /var/log/apache2/other_vhosts_access.log \
 && chown -R www-data:www-data /var/log/apache2
