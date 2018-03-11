FROM alpine

ARG AVR8_TOOLCHAIN_VERSION=3.5.4.1709
ARG ATTINY_DFP_VERSION=1.3.172
ARG ATMEGA_DFP_VERSION=1.2.209
ARG VCS_URL=https://github.com/kesor/avr-toolchain-docker
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="AVR Toolchain" \
      org.label-schema.description="Atmel AVR toolchain in a Docker container"

# https://www.microchip.com/avr-support/avr-and-arm-toolchains-(c-compilers)
ENV AVR8_TOOLCHAIN_VERSION $AVR8_TOOLCHAIN_VERSION
RUN echo "Downloading AVR8 GNU Toolchain v${AVR8_TOOLCHAIN_VERSION}" 1>&2 \
    && wget http://ww1.microchip.com/downloads/en/DeviceDoc/avr8-gnu-toolchain-${AVR8_TOOLCHAIN_VERSION}-linux.any.x86_64.tar.gz \
    && tar xzf avr8-gnu-toolchain-*.tar.gz \
    && rm avr8-gnu-toolchain-*.tar.gz

# http://packs.download.atmel.com/
ENV ATTINY_DFP_VERSION $ATTINY_DFP_VERSION
RUN echo "Downloading ATtiny DFP v${ATTINY_DFP_VERSION}" 1>&2 \
    && wget http://packs.download.atmel.com/Atmel.ATtiny_DFP.${ATTINY_DFP_VERSION}.atpack \
    && mkdir -p Atmel/ATtiny_DFP \
    && unzip -q -d Atmel/ATtiny_DFP Atmel.ATtiny_DFP.*.atpack \
    && rm Atmel.ATtiny_DFP.*.atpack

# http://packs.download.atmel.com/
ENV ATMEGA_DFP_VERSION $ATMEGA_DFP_VERSION
RUN echo "Downloading ATmega DFP v${ATMEGA_DFP_VERSION}" 1>&2 \
    && wget http://packs.download.atmel.com/Atmel.ATmega_DFP.${ATMEGA_DFP_VERSION}.atpack \
    && mkdir -p Atmel/ATmega_DFP \
    && unzip -q -d Atmel/ATmega_DFP Atmel.ATmega_DFP.*.atpack \
    && rm Atmel.ATmega_DFP.*.atpack
