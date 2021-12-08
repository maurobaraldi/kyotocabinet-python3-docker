FROM python:3.8-alpine

ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

WORKDIR /var/code

ADD http://fallabs.com/kyotocabinet/pkg/kyotocabinet-1.2.79.tar.gz /var/code
ADD https://dbmx.net/kyotocabinet/pythonpkg/kyotocabinet-python-1.23.tar.gz /var/code

RUN apk update && apk upgrade \
&& apk --no-cache add libstdc++ \
&& apk --no-cache add --virtual build-dependencies build-base zlib-dev curl\
&& tar xzf /var/code/kyotocabinet-1.2.79.tar.gz -C /var/code/ \
&& cd /var/code/kyotocabinet-1.2.79 \
&& ./configure && make && make install \
&& tar -xzf /var/code/kyotocabinet-python-1.23.tar.gz -C /var/code/ \
&& cd /var/code/kyotocabinet-python-1.23 \
&& python setup.py install \
&& rm -rf /var/code/*

LABEL org.label-schema.schema-version="0.1" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="kyotocabinet-python" \
      org.label-schema.description="Python 3 Docker Alpine image with Kyotocabinet DB." \
      org.label-schema.url="" \
      org.label-schema.vcs-url="https://github.com/maurobaraldi/kyotocabinet-python3-docker" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vendor="Blokus Cloud Infrastructure Services" \
      org.label-schema.version=$BUILD_VERSION \
      org.label-schema.docker.cmd="docker run -it -v ${PWD}:/var/code --name kyotodb-py3 maurobaraldi/kyotocabinet-python"
