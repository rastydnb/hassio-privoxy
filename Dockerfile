ARG BUILD_FROM=hassioaddons/base:4.0.2
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Setup base
RUN apk add --no-cache \
    coreutils=8.31-r0 \
    wget=1.20.3-r0

RUN  apk --update --no-cache add privoxy bash  


SHELL ["/bin/bash", "-o", "pipefail", "-c"]

EXPOSE 8118 
COPY service /etc/service
COPY run.sh /run.sh
RUN chmod +x /run.sh
ADD privoxy /etc/privoxy/config

CMD ["/run.sh"]



# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Privoxy" \
    io.hass.description="Privoxy add-on by Community Hass.io Add-ons" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Gipsydanger <naitmaikel191@gmail.com>" \
    org.label-schema.description="Privoxy add-on by Community Hass.io Add-ons" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Privoxy" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://addons.community" \
    org.label-schema.usage="https://github.com/hassio-addons/addon-example/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/hassio-addons/addon-example" \
    org.label-schema.vendor="Community Hass.io Addons"
