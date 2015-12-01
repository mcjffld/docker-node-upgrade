FROM centos:latest

#ENV HTTP_PROXY=http://iwsva.corp.pcln.com:8080
#ENV HTTPS_PROXY=http://iwsva.corp.pcln.com:8080
#ENV NO_PROXY='localhost,pcln.com,(prod|corp|dev|qa|dmz|dqs)\.(pcln|priceline)\.(com),192.168.99.100'
#ENV http_proxy=http://iwsva.corp.pcln.com:8080
#ENV https_proxy=http://iwsva.corp.pcln.com:8080
#ENV no_proxy='localhost,pcln.com,(prod|corp|dev|qa|dmz|dqs)\.(pcln|priceline)\.(com),192.168.99.100'

COPY nodesource-el-0.12.repo /etc/yum.repos.d/

RUN curl -sL https://rpm.nodesource.com/pub/el/NODESOURCE-GPG-SIGNING-KEY-EL > /etc/pki/rpm-gpg/NODESOURCE-GPG-SIGNING-KEY-EL

RUN rpm --import /etc/pki/rpm-gpg/NODESOURCE-GPG-SIGNING-KEY-EL

RUN yum install -y nodejs gcc g++ make cmake git

COPY app /app

COPY nodesource-el-4.x.repo /

COPY test-upgrade.sh /

RUN npm install pm2 grunt grunt-cli bower -g

CMD ["/bin/bash"]

