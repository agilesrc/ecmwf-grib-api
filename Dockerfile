FROM centos:7

MAINTAINER "AgileSrc LLC" <support@agilesrc.com>

ENV GRIB_API_VERSION 1.15.0

#https://software.ecmwf.int/wiki/download/attachments/3473437/grib_api-1.14.7-Source.tar.gz?api=v2
RUN yum install -y openjpeg openjpeg-devel gcc-c++ gfortan wget make \
	&& cd /tmp &&  wget https://software.ecmwf.int/wiki/download/attachments/3473437/grib_api-${GRIB_API_VERSION}-Source.tar.gz \
    && cd /tmp && tar xvzf grib_api-${GRIB_API_VERSION}-Source.tar.gz && rm -f grib_api-${GRIB_API_VERSION}-Source.tar.gz \
    && cd /tmp/grib_api-${GRIB_API_VERSION}-Source && /tmp/grib_api-${GRIB_API_VERSION}-Source/configure \
	&& cd /tmp/grib_api-${GRIB_API_VERSION}-Source && make \
	&& cd /tmp/grib_api-${GRIB_API_VERSION}-Source && make check \
	&& cd /tmp/grib_api-${GRIB_API_VERSION}-Source && make install \
	&& rm -rf /tmp/* && yum -y remove wget make gcc-c++ openjpeg-devel && yum clean all

VOLUME /input
VOLUME /output
