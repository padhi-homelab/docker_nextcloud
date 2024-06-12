ARG NEXTCLOUD_VERSION=29.0.2


FROM nextcloud:$NEXTCLOUD_VERSION AS builder

ARG DLIB_VERSION=v19.24.4
ADD https://github.com/davisking/dlib/archive/refs/tags/$DLIB_VERSION.tar.gz \
    /tmp/dlib.tar.gz

ARG PDLIB_VERSION=v1.1.0
ADD https://github.com/goodspb/pdlib/archive/refs/tags/$PDLIB_VERSION.tar.gz \
    /tmp/pdlib.tar.gz

RUN apt-get update -yq \
 && apt-get install -yq build-essential \
                        cmake \
                        libbz2-dev libopenblas-dev libx11-dev \
 && docker-php-ext-install bz2 \
 && cd /tmp \
 && tar xf dlib.tar.gz \
 && mv dlib-* dlib \
 && cd dlib/dlib \
 && mkdir build \
 && cd build \
 && cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release .. \
 && make \
 && make install \
 && cd /tmp \
 && tar xf pdlib.tar.gz \
 && mv pdlib-* pdlib \
 && cd pdlib \
 && phpize \
 && ./configure \
 && make \
 && make install


FROM nextcloud:$NEXTCLOUD_VERSION

COPY --from=builder \
     /usr/local/lib/libdlib.so* \
     /usr/local/lib

COPY --from=builder \
     /usr/local/lib/php/extensions/no-debug-non-zts-20220829/pdlib.so \
     /usr/local/lib/php/extensions/no-debug-non-zts-20220829/

COPY docker-entrypoint.sh \
     /docker-entrypoint.sh

RUN apt-get update -yq \
 && apt-get install -yq --no-install-recommends \
                        ffmpeg \
                        ghostscript \
                        libmagickcore-6.q16-6-extra \
                        libopenblas0 \
                        libbz2-dev \
 && docker-php-ext-install bz2 \
 && echo "extension=pdlib.so" > /usr/local/etc/php/conf.d/pdlib.ini \
 && echo memory_limit=1024M > /usr/local/etc/php/conf.d/memory-limit.ini

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["apache2-foreground"]
