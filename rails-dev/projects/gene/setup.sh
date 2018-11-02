#!/bin/bash

if ! type wkhtmltopdf; then
	cd /opt && \
	sudo wget http://pkg_host:20000/wkhtmltox_0.12.5-1.bionic_amd64.deb && \
	sudo apt install -y ./wkhtmltox_0.12.5-1.bionic_amd64.deb && \
	sudo rm wkhtmltox_0.12.5-1.bionic_amd64.deb
fi
