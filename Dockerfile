FROM alpine
LABEL maintainer="Juan Bautista Mesa Roldán <juan.mesa@hidup.io>"

ENV DIST_MIRROR http://archive.apache.org/dist/nifi
ENV VERSION 1.7.0

ENV NIFI_HOME=/opt/nifi
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

RUN apk add --no-cache tzdata bash curl openjdk8

WORKDIR    ${NIFI_HOME}

RUN mkdir -p ${NIFI_HOME}
RUN curl ${DIST_MIRROR}/${VERSION}/nifi-${VERSION}-bin.tar.gz > /tmp/nifi-${VERSION}-bin.tar.gz

COPY deploy/start.sh /
RUN chmod +x /start.sh

EXPOSE     8080 8081 8443

ENTRYPOINT ["/start.sh"]
