FROM leeonky/x11app:ubuntu

USER $USER_NAME

ENV idea_package=ideaIU-2018.2.5.tar.gz
ENV idea_conf_path=.IntelliJIdea2018.2
RUN cd $USER_HOME/ &&\
	wget https://download.jetbrains.com/idea/$idea_package &&\
	tar -xvf $idea_package &&\
	mv idea-* idea &&\
	rm $idea_package

RUN sudo apt-get update && sudo apt-get install -y openjdk-11-jdk openjfx

ADD install_plugin_zip.sh $USER_HOME/bin/install_plugin_zip.sh

ENV IDEA_CONF_PATH $USER_HOME/$idea_conf_path/

RUN sudo chmod +x $USER_HOME/bin/* && sudo chown $USER_NAME:$USER_NAME $USER_HOME/bin/* &&\
	mkdir -p $IDEA_CONF_PATH &&\
	mkdir $USER_HOME/idea_system &&\
	ln -s $USER_HOME/idea_system $IDEA_CONF_PATH/system &&\
	mkdir -p "$USER_HOME/.gradle/caches/modules-2/files-2.1" &&\
	chown $USER_NAME:$USER_NAME -R "$USER_HOME/.gradle" &&\
	mkdir -p "$USER_HOME/.m2" &&\
	chown $USER_NAME:$USER_NAME -R "$USER_HOME/.m2"

#install fonts
#RUN cd $USER_HOME && curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash

#ideavim plugin
RUN mkdir -p $IDEA_CONF_PATH/config/plugins &&\
	cd $IDEA_CONF_PATH/config/plugins &&\
	$USER_HOME/bin/install_plugin_zip.sh "http://plugins.jetbrains.com/files/164/51219/IdeaVim-0.50.zip?updateId=51219" &&\
	$USER_HOME/bin/install_plugin_zip.sh "http://plugins.jetbrains.com/files/6317/51517/lombok-plugin-0.22-2018.2.zip?updateId=51517&pluginId=6317" &&\
	curl -o intellij-plugin-save-actions-1.2.0.jar "https://plugins.jetbrains.com/files/7642/49943/intellij-plugin-save-actions-1.2.0.jar?updateId=49943&pluginId=7642" &&\
	$USER_HOME/bin/install_plugin_zip.sh "https://plugins.jetbrains.com/files/8347/51658/intellij-swagger.zip?updateId=51658&pluginId=8347"

RUN cd $IDEA_CONF_PATH &&\
	git clone https://github.com/leeonky/idea-config.git &&\
	mv idea-config/* config/ &&\
	mv idea-config/.git* config/ &&\
	rm -r idea-config

ADD .ideavimrc $USER_HOME/.ideavimrc

