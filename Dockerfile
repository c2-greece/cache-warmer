FROM debian:11-slim

MAINTAINER Cloud Concept "support@c2.gr"

ENV SITEMAP=http://www.example.com/sitemap.xml

RUN apt update  && apt install siege curl -y
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/*

COPY executor.sh /
RUN chmod +x /executor.sh

ENTRYPOINT ["/executor.sh"]