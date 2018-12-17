FROM centos:7

MAINTAINER Martin Wyett

RUN yum install -y wget \
        && yum install -y epel-release \
        && yum install -y python34-pip \
        && pip3 install requests \
        && pip3 install validators 

RUN rpm --import http://packages.icinga.org/icinga.key \
        && wget --no-check-certificate https://packages.icinga.org/epel/7/release/noarch/icinga-rpm-release-7-1.el7.centos.noarch.rpm \
        && rpm -i icinga-rpm-release-7-1.el7.centos.noarch.rpm \
        && yum install icinga2 nagios-plugins-all -y
