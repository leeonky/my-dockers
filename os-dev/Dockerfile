FROM leeonky/os-base:ubuntu

USER root

###### install basic tools
#skip deltarpm
RUN apt-fast update && apt-fast install -y \
	software-properties-common \
	net-tools \
	iputils-ping \
	dpkg-dev \
	openssh-client \
	bash-completion \
	wget \
	zip \
	unzip \
	dos2unix \
	jq && \
	apt-fast clean

###### install git and config
RUN apt-fast -y install \
	zlib1g-dev \
	libcurl4-openssl-dev \
	gettext && \
	apt-fast clean && \
	wget http://pkg_host:20000/git-2.10.2.tar.gz && \
	tar -zxf git-2.10.2.tar.gz && \
	cd git-2.10.2 && \
	./configure && \
	make -j4 && \
	make install && \
	cd ../ && \
	rm -rf git-2.10.2*

###### install docker client
RUN install-docker

###### load dot files
USER $USER_NAME
