FROM augustash/alpine-phpfpm-dev:3.0.1

# environment
ENV PHP_MEMORY_LIMIT 1024M
ENV MAGENTO_PATH /src
ENV MAGENTO_CODEBASE open-source
ENV MAGENTO_USE_SAMPLE_DATA false
ENV MAGENTO_INSTALL_DB false
ENV MAGENTO_PHPSTORM_META false

# packages & configure
RUN apk-install libxml2 nodejs nodejs-npm \
    && /usr/bin/npm install -g gulp grunt \
    && curl -sS -o /usr/local/bin/n98-magerun2.phar https://files.magerun.net/n98-magerun2.phar \
    && chmod a+x /usr/local/bin/n98-magerun2.phar \
    && apk-cleanup
# https://devdocs.magento.com/guides/v2.3/install-gde/system-requirements-tech.html

# copy root filesystem
COPY rootfs /

# external
EXPOSE 9000 9004
WORKDIR /src

# run s6 supervisor
ENTRYPOINT ["/init"]
