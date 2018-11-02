FROM leeonky/x11app:ubuntu

USER $USER_NAME

RUN cd $USER_HOME/ && \
	wget https://download.jetbrains.com/idea/ideaIU-2018.2.5.tar.gz && \
	tar -xvf ideaIU-2018.2.5.tar.gz && \
	rm ideaIU-2018.2.5.tar.gz

ENV IDEA_PATH "$USER_HOME/idea-IU-182.4892.20/"

ADD install_plugin_zip.sh $USER_HOME/bin/install_plugin_zip.sh

RUN sudo chmod +x $USER_HOME/bin/* && sudo chown $USER_NAME:$USER_NAME $USER_HOME/bin/*

#ideavim plugin
RUN $USER_HOME/bin/install_plugin_zip.sh "http://plugins.jetbrains.com/files/164/51219/IdeaVim-0.50.zip?updateId=51219"

