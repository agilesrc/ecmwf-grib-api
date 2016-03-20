FROM centos:7

MAINTAINER "AgileSrc LLC" <support@agilesrc.com>

RUN yum install -y openjpeg openjpeg-devel gcc-c++ gfortan wget make

ENV GRIB_API_VERSION 1.14.7

#https://software.ecmwf.int/wiki/download/attachments/3473437/grib_api-1.14.7-Source.tar.gz?api=v2
RUN cd /tmp &&  wget https://software.ecmwf.int/wiki/download/attachments/3473437/grib_api-${GRIB_API_VERSION}-Source.tar.gz \
    && cd /tmp && tar xvzf grib_api-${GRIB_API_VERSION}-Source.tar.gz && rm -f grib_api-${GRIB_API_VERSION}-Source.tar.gz
    
RUN cd /tmp/grib_api-${GRIB_API_VERSION}-Source && /tmp/grib_api-${GRIB_API_VERSION}-Source/configure
RUN cd /tmp/grib_api-${GRIB_API_VERSION}-Source && make
RUN cd /tmp/grib_api-${GRIB_API_VERSION}-Source && make check
RUN cd /tmp/grib_api-${GRIB_API_VERSION}-Source && make install

RUN rm -rf /tmp/*

VOLUME /input
VOLUME /output