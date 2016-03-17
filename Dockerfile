FROM centos:7

MAINTAINER "AgileSrc LLC" <support@agilesrc.com>

RUN yum install -y openjpeg openjpeg-devel gcc-c++ gfortan wget make

ENV GRIB_API_VERSION 1.11.0

RUN cd /tmp &&  wget https://software.ecmwf.int/wiki/download/attachments/3473437/grib_api-${GRIB_API_VERSION}.tar.gz \
    && cd /tmp && tar xvzf grib_api-${GRIB_API_VERSION}.tar.gz && rm -f grib_api-${GRIB_API_VERSION}.tar.gz
    
RUN cd /tmp/grib_api-${GRIB_API_VERSION} && /tmp/grib_api-${GRIB_API_VERSION}/configure
RUN cd /tmp/grib_api-${GRIB_API_VERSION} && make
RUN cd /tmp/grib_api-${GRIB_API_VERSION} && make check
RUN cd /tmp/grib_api-${GRIB_API_VERSION} && make install

RUN rm -rf /tmp/grib_api*

VOLUME /input
VOLUME /output