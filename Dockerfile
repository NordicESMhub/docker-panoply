FROM jlesage/baseimage-gui:ubuntu-18.04 AS build

MAINTAINER Anne Fouilloux, annefou@geo.uio.no

# Get packages including Java
RUN apt-get update -y && \
     DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
         ca-certificates \
         openjdk-11-jdk openjdk-11-jre \
         vim \
         wget \
         file \
         libcurl4-openssl-dev && \
     rm -rf /var/lib/apt/lists/*

# Copy the start script.
COPY startapp.sh /startapp.sh

# Generate and install favicons.
RUN \
    APP_ICON_URL=https://github.com/NordicESMhub/docker-panoply/raw/master/panoply-app-icon.png && \
    install_app_icon.sh "$APP_ICON_URL"

# Set the name of the application.
ENV APP_NAME="Panoply"

ENV KEEP_APP_RUNNING=0

ENV TAKE_CONFIG_OWNERSHIP=1

# Set environment

ENV JAVA_HOME /opt/jdk

ENV PATH ${PATH}:${JAVA_HOME}/bin   


COPY PanoplyJ-4.12.5.tgz /opt/PanoplyJ-4.12.5.tgz

RUN cd /opt && \ 
    tar zxvf PanoplyJ-4.12.5.tgz && \
    rm -rf PanoplyJ-4.12.5.tgz

COPY colorbars.tar /opt/PanoplyJ/colorbars.tar

COPY panoply.sh /opt/PanoplyJ/panoply.sh


RUN chmod uog+x /opt/PanoplyJ/panoply.sh

WORKDIR /config
