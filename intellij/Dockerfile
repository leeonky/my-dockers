FROM leeonky/x11app:ubuntu

USER $USER_NAME

RUN sudo add-apt-repository ppa:openjdk-r/ppa && sudo apt-fast update && sudo apt-fast install -y openjdk-11-jdk openjfx openjdk-8-jdk

ENV idea_package=ideaIU-2019.1.4.tar.gz
RUN cd $USER_HOME/ &&\
	wget -O $idea_package https://download-cf.jetbrains.com/idea/ideaIU-2019.1.4.tar.gz?_ga=2.5666867.1498543141.1611237329-1293729772.1607926220 && \
	ls -l && \
	tar -xvf $idea_package &&\
	mv idea-* idea &&\
	rm $idea_package

ADD install_plugin_zip.sh $USER_HOME/bin/install_plugin_zip.sh

ENV idea_conf_path=.IntelliJIdea2019.1
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
	$USER_HOME/bin/install_plugin_zip.sh "https://plugins.jetbrains.com/files/164/58115/IdeaVim-0.51.zip?updateId=58115&pluginId=164&family=intellij" &&\
	$USER_HOME/bin/install_plugin_zip.sh "https://plugins.jetbrains.com/files/6317/61697/lombok-plugin-0.25-EAP.zip?updateId=61697&pluginId=6317&family=INTELLIJ" &&\
	curl -o intellij-plugin-save-actions-1.2.0.jar "https://plugins.jetbrains.com/files/7642/54687/intellij-plugin-save-actions-1.4.0.jar?updateId=54687&pluginId=7642&family=intellij" &&\
	$USER_HOME/bin/install_plugin_zip.sh "https://plugins.jetbrains.com/files/8347/62152/intellij-swagger.zip?updateId=62152&pluginId=8347&family=INTELLIJ"

RUN cd $IDEA_CONF_PATH &&\
	git clone https://github.com/leeonky/idea-config.git &&\
	mv idea-config/* config/ &&\
	mv idea-config/.git* config/ &&\
	rm -r idea-config

ADD .ideavimrc $USER_HOME/.ideavimrc

