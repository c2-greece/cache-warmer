FROM alpine:latest

MAINTAINER Cloud Concept "support@c2.gr"

ENV VERSION=3.1.4
ENV SITEMAP=http://www.example.com/sitemap.xml

RUN apk update \
    && apk add curl g++ make \
    && curl http://download.joedog.org/siege/siege-$VERSION.tar.gz > siege-$VERSION.tar.gz \
    && tar -xf siege-${VERSION}.tar.gz \
    && cd siege-${VERSION} \
    && ./configure \
    && make install

ENTRYPOINT ["siege -c1 -f $SITEMAP"]