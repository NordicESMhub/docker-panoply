FROM jlesage/baseimage-gui:alpine-3.6

MAINTAINER Anne Fouilloux, annefou@geo.uio.no

# Install xterm.
RUN apk update && \
    apk add ca-certificates wget xterm openjdk8-jre && \
            update-ca-certificates  

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
ENV APP_NAME="Panoply"

# Set environment

ENV JAVA_HOME /opt/jdk

ENV PATH ${PATH}:${JAVA_HOME}/bin   

COPY colorbars.tar /opt/colorbars.tar

RUN mkdir /opt/data && cd /opt && \ 
    wget https://www.giss.nasa.gov/tools/panoply/download/PanoplyJ-4.11.0.tgz && \
    tar zxvf PanoplyJ-4.11.0.tgz && \
    rm -rf PanoplyJ-4.11.0.tgz  && \
    cd /opt/PanoplyJ && tar xvf /opt/colorbars.tar 

WORKDIR /opt/data

