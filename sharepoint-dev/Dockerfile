FROM leeonky/os-dev:ubuntu

USER $USER_NAME

RUN sudo apt-get update && sudo apt-get install -y \
	build-essential nodejs npm

RUN sudo npm install -g yo gulp @microsoft/generator-sharepoint
	


