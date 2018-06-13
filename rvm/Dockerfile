FROM leeonky/os-dev:ubuntu

USER $USER_NAME

###### RVM
RUN /bin/bash --login -c "gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && ( \curl -sSL https://get.rvm.io | bash -s stable ) && source /home/$USER_NAME/.rvm/scripts/rvm"

#skip chrome and chromedriver
#RUN ( wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - ) && \
	#( echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list )

###### tools for install rails
RUN sudo apt-get update && sudo apt-get install -y \
	chromium-browser \
	chromium-chromedriver \
	libcanberra0 libdbusmenu-glib4 libdbusmenu-gtk4 libgtk2.0-0 libgtk2.0-bin \
	libgtk2.0-common libogg0 libstartup-notification0 libtdb1 libvorbis0a \
	libvorbisfile3 libxcb-util1 sound-theme-freedesktop xul-ext-ubufox \
	postgresql-server-dev-all \
	libsqlite3-dev \
	fonts-wqy-microhei \
	libqtwebkit-dev && \
	cd /opt && \
	sudo wget https://gitee.com/leeonky/tools_dev/raw/master/firefox-46.0.tar.bz2 && \
	sudo tar -xvf firefox-46.0.tar.bz2 && \
	sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox && \
	sudo rm firefox-46.0.tar.bz2

ADD tglgemsrc $USER_HOME/bin/
RUN sudo chmod +x $USER_HOME/bin/tglgemsrc


