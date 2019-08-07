FROM leeonky/os-dev:ubuntu

USER $USER_NAME

###### install vim extended
RUN sudo apt-get update && sudo apt-get install -y \
	vim vim-common vim-nox && \
	sudo apt-get clean

###### markdown plugin
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && \
	sudo apt-get -y install nodejs xdg-utils firefox fonts-wqy-microhei && \
	sudo apt-get clean && \
	sudo npm -g install instant-markdown-d

###### eslint
RUN sudo npm -g install eslint eslint-plugin-vue

###### VIM plugins
USER $USER_NAME
ADD vimrc $USER_HOME/.vimrc
ADD vimrc.d $USER_HOME/.vimrc.d
ADD .eslintrc $USER_HOME/.eslintrc
RUN sudo chown $USER_NAME:$USER_NAME $USER_HOME/.vimrc && \
	sudo chown $USER_NAME:$USER_NAME $USER_HOME/.vimrc.d -R && \
	sudo chown $USER_NAME:$USER_NAME $USER_HOME/.eslintrc -R && \
	/bin/bash --login $USER_HOME/.vimrc.d/vim_install.sh

