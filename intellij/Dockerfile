FROM leeonky/x11app:ubuntu

USER $USER_NAME

RUN sudo apt-get update && sudo apt-get install -y openjdk-11-jdk

RUN cd $USER_HOME/ &&\
	wget https://download.jetbrains.com/idea/ideaIU-2018.2.5.tar.gz &&\
	tar -xvf ideaIU-2018.2.5.tar.gz &&\
	mv idea-* idea &&\
	rm ideaIU-2018.2.5.tar.gz

ADD install_plugin_zip.sh $USER_HOME/bin/install_plugin_zip.sh

RUN sudo chmod +x $USER_HOME/bin/* && sudo chown $USER_NAME:$USER_NAME $USER_HOME/bin/*

RUN mkdir -p ~/.IntelliJIdea2018.2/ && cd ~/.IntelliJIdea2018.2/ &&\
	git clone https://github.com/leeonky/idea-config.git &&\
	mv idea-config config

#ideavim plugin
RUN mkdir -p ~/.IntelliJIdea2018.2/config/plugins &&\
	cd ~/.IntelliJIdea2018.2/config/plugins &&\
	$USER_HOME/bin/install_plugin_zip.sh "http://plugins.jetbrains.com/files/164/51219/IdeaVim-0.50.zip?updateId=51219" &&\
	$USER_HOME/bin/install_plugin_zip.sh "http://plugins.jetbrains.com/files/6317/51517/lombok-plugin-0.22-2018.2.zip?updateId=51517&pluginId=6317" &&\
	curl -o intellij-plugin-save-actions-1.2.0.jar "https://plugins.jetbrains.com/files/7642/49943/intellij-plugin-save-actions-1.2.0.jar?updateId=49943&pluginId=7642" &&\
	$USER_HOME/bin/install_plugin_zip.sh "https://plugins.jetbrains.com/files/8347/51658/intellij-swagger.zip?updateId=51658&pluginId=8347"

