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

ENV KEEP_APP_RUNNING=0

ENV TAKE_CONFIG_OWNERSHIP=1

ENV SECURE_CONNECTION=1

# Set environment

ENV JAVA_HOME /opt/jdk

ENV PATH ${PATH}:${JAVA_HOME}/bin   

RUN cd /opt && \ 
    wget https://www.giss.nasa.gov/tools/panoply/download/PanoplyJ-4.11.0.tgz && \
    tar zxvf PanoplyJ-4.11.0.tgz && \
    rm -rf PanoplyJ-4.11.0.tgz 

COPY panoply.sh /opt/PanoplyJ/panoply.sh

COPY colorbars.tar /opt/PanoplyJ/colorbars.tar

RUN chmod uog+x /opt/PanoplyJ/panoply.sh

WORKDIR /config
