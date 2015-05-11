FROM centos:7

MAINTAINER Aaron Stone <aaronastone@gmail.com>

# Install the EPEL repository
#RUN yum -y install \
#  epel-release

# Install core RPMs
RUN yum -y install \
  java-1.7.0-openjdk \
  java-1.7.0-openjdk-devel \
  maven

# Create the data dir.
RUN mkdir /data

# Define working directory.
WORKDIR /data

# Open port 8080 for app and 22 for SSH
EXPOSE 8080 22

# Expose our source directory.
VOLUME ["/vagrant", "/data"]

COPY ./config/build-serve.sh /
ENTRYPOINT ["/build-serve.sh"]