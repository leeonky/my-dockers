#!/bin/bash

if ! type wkhtmltopdf; then
	cd /opt && \
	sudo wget https://gitee.com/leeonky/tools_dev/raw/master/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz && \
	sudo tar -xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz && \
	sudo ln -s /opt/wkhtmltox/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf && \
	sudo rm wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
fi
