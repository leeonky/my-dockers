FROM leeonky/os-dev:ubuntu

RUN sudo apt-get update && sudo apt-get install -y libcunit1-dev automake libtool

RUN cd ~ && git clone https://github.com/leeonky/cunitexd.git && cd cunitexd && autoreconf -i && ./configure && make && sudo make install

ADD runtest /usr/local/bin/

