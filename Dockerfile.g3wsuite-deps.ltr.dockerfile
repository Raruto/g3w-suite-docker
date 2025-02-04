FROM ubuntu:focal
# This image is available as g3wsuite/g3w-suite-deps:latest-ltr
LABEL maintainer="Gis3w" Description="This image is used to prepare build requirements for g3w-suite docker images" Vendor="Gis3w" Version="dev"

ENV DEBIAN_FRONTEND=noninteractive
RUN chown root:root /tmp && chmod ugo+rwXt /tmp
RUN apt-get update && apt install -y \
    libxml2-dev \
    libxslt-dev \
    postgresql-server-dev-all \
    libgdal-dev \
    python3-dev \
    libgdal26 \
    python3-gdal \
    python3-pip \
    curl \
    wget \
    vim \
    wait-for-it \
    gdal-bin \
    libsqlite3-mod-spatialite \
    dirmngr \
    xvfb
# PyQGIS 3.16
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key 46B5721DBBD2996A && \
    echo "deb [arch=amd64] https://qgis.org/ubuntu-ltr focal main" >> /etc/apt/sources.list && \
    apt update && apt install -y python3-qgis qgis-server
# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
    tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt install -y yarn
RUN mkdir /code
WORKDIR /code
