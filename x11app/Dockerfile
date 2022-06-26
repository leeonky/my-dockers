FROM leeonky/os-dev:ubuntu

USER $USER_NAME

#RUN sudo apt-fast install -y \
	#fcitx fcitx-libs fcitx-libs-qt libopencc1 dbus-x11 \
	#firefox

#input method and firefox
RUN sudo apt-fast update && sudo apt-fast install -y \
	ibus ibus-clutter ibus-gtk ibus-gtk3 ibus-qt4 dbus-x11 ibus-rime \
	fonts-wqy-microhei \
	firefox

ADD setup_im.sh $USER_HOME/bin/setup_im.sh
ADD x11app_launch.sh $USER_HOME/bin/x11app_launch.sh
RUN sudo chmod +x $USER_HOME/bin/* && sudo chown $USER_NAME:$USER_NAME $USER_HOME/bin/*

