FROM ubuntu:16.04

####### source list ######
ADD sources.list /etc/apt/sources.list

#netbase tcp/ip support
#locales-all all languages utf-8 encoding
#nfs-common nfs client
#locales support set locale
### skip:
###net-tools dpkg-dev
RUN apt-get update && \
	apt-get -y install \
	sudo \
	netbase \
	locales-all \
	nfs-common \
	locales \
	tzdata \
	curl \
	&& apt-get clean \
	&& locale-gen en_US && locale-gen en_US.UTF-8 && update-locale && localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8

###### add user gauss
ENV USER_NAME gauss
ENV USER_HOME /home/$USER_NAME
RUN ( printf 'devuser\ndevuser\n' | passwd ) && \
	useradd $USER_NAME -m && \
	( echo 'gauss    ALL=(ALL)       NOPASSWD:ALL' > /etc/sudoers.d/$USER_NAME ) && \
	sed 's/^Defaults \{1,\}requiretty'//g -i /etc/sudoers

###### set lang
ADD lang.sh /etc/profile.d/

###### tools
ADD main_loop /usr/local/bin/
ADD install-docker /usr/local/bin/
ADD bproxy /usr/local/bin/
RUN sudo chmod +x /usr/local/bin/main_loop /usr/local/bin/install-docker /usr/local/bin/bproxy

USER $USER_NAME
###### enable user .bashrc.d
RUN echo 'for f in $(ls ~/.bashrc.d/); do source ~/.bashrc.d/$f; done' >> $USER_HOME/.bashrc && \
	mkdir -p $USER_HOME/.bashrc.d

CMD bash
