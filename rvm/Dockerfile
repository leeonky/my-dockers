FROM leeonky/os-dev:ubuntu

USER $USER_NAME

###### RVM
RUN apt-fast update && apt-fast install -y gnupg2 && \
	/bin/bash --login -c "gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && ( \curl -sSL https://get.rvm.io | bash -s stable ) && source /home/$USER_NAME/.rvm/scripts/rvm"

#skip chrome and chromedriver
#RUN ( wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - ) && \
	#( echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list )

###### tools for install rails
RUN sudo apt-fast install -y \
	postgresql-server-dev-all \
	libsqlite3-dev \
	fonts-wqy-microhei \
	libqtwebkit-dev \
	firefox && \
	#libcanberra0 libdbusmenu-glib4 libdbusmenu-gtk4 libgtk2.0-0 libgtk2.0-bin \
	#libgtk2.0-common libogg0 libstartup-notification0 libtdb1 libvorbis0a \
	#libvorbisfile3 libxcb-util1 sound-theme-freedesktop xul-ext-ubufox \
	apt-fast clean

RUN cd /usr/local/bin/ && sudo wget 'http://pkg_host:20000/geckodriver' && sudo chmod +x geckodriver

ADD tglgemsrc $USER_HOME/bin/
RUN sudo chmod +x $USER_HOME/bin/tglgemsrc


