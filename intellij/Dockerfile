FROM leeonky/x11app:ubuntu

USER $USER_NAME

RUN sudo apt-get update && sudo apt-get install -y openjdk-11-jdk

RUN cd $USER_HOME/ &&\
	wget https://download.jetbrains.com/idea/ideaIU-2018.2.5.tar.gz &&\
	tar -xvf ideaIU-2018.2.5.tar.gz &&\
	mv idea-* idea &&\
	rm ideaIU-2018.2.5.tar.gz

ENV IDEA_PATH "$USER_HOME/idea"

ADD install_plugin_zip.sh $USER_HOME/bin/install_plugin_zip.sh

RUN sudo chmod +x $USER_HOME/bin/* && sudo chown $USER_NAME:$USER_NAME $USER_HOME/bin/*

#ideavim plugin
RUN $USER_HOME/bin/install_plugin_zip.sh "http://plugins.jetbrains.com/files/164/51219/IdeaVim-0.50.zip?updateId=51219"

