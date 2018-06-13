FROM leeonky/rvm:ubuntu

USER $USER_NAME

#RUN sudo rpm -ivh https://kojipkgs.fedoraproject.org//packages/http-parser/2.7.1/3.el7/x86_64/http-parser-2.7.1-3.el7.x86_64.rpm

ARG SECRET_RSA

ARG SECRET_HOST

RUN sudo apt-get update && sudo apt-get install -y imagemagick libmagickwand-dev nodejs npm && \
	cd /tmp && \
	wget https://gitee.com/leeonky/tools_dev/raw/master/redis-3.2.11.tar.gz && \
	tar xzf redis-3.2.11.tar.gz && \
	cd redis-3.2.11/ && \
	make -j4 && \
	sudo make install && \
	cd ../ && \
	rm -rf redis-3.2.11*

#install ruby in china
RUN echo "ruby_url=https://cache.ruby-china.org/pub/ruby" > ~/.rvm/user/db

ADD projects /tmp/projects
ADD setup_project.sh /tmp/setup_project.sh

RUN sudo chown $USER_NAME:$USER_NAME /tmp/projects -R
RUN /bin/bash --login /tmp/setup_project.sh /tmp/projects/gene "$SECRET_RSA" "$SECRET_HOST"
#RUN /bin/bash --login /tmp/setup_project.sh /tmp/projects/oulu
#RUN /bin/bash --login /tmp/setup_project.sh /tmp/projects/ule-web
RUN /bin/bash --login /tmp/setup_project.sh /tmp/projects/default "$SECRET_RSA" "$SECRET_HOST"

CMD bash
