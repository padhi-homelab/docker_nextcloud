FROM nextcloud:30.0.4

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN apt-get update -yq \
 && apt-get install -yq --no-install-recommends \
                        ffmpeg \
                        ghostscript \
                        iproute2 \
 && echo memory_limit=1024M > /usr/local/etc/php/conf.d/memory-limit.ini \
 && ln -fs /dev/null /var/log/apache2/access.log \
 && ln -fs /dev/null /var/log/apache2/other_vhosts_access.log \
 && chown -R www-data:www-data /var/log/apache2

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["apache2-foreground"]
