#!/bin/bash
# Created on 2020-03-13T17:53:52+1100, using template:golang.sh.tmpl and json:gearbox.json

test -f /etc/gearbox/bin/colors.sh && . /etc/gearbox/bin/colors.sh

c_ok "Started."

c_ok "Installing packages."
if [ -f /etc/gearbox/build/golang.apks ]
then
	APKS="$(cat /etc/gearbox/build/golang.apks)"
	apk update && apk add --no-cache ${APKS}; checkExit
fi

if [ -f /etc/gearbox/build/golang.env ]
then
	. /etc/gearbox/build/golang.env
fi

if [ ! -d /usr/local/bin ]
then
	mkdir -p /usr/local/bin; checkExit
fi

URL="https://dl.google.com/go/go${VERSION}.linux-amd64.tar.gz"
c_info "Fetching from $URL"
cd /usr/local
wget -qO- --no-check-certificate ${URL} | tar zxf - ; checkExit

if [ ! -f /usr/local/go/bin/go ]
then
	c_err "Failed to find /usr/local/go/bin/go"
else
	chmod a+x /usr/local/go/bin/go; checkExit
	/usr/local/go/bin/go version; checkExit
fi


cd /usr/local/bin/
URL="https://github.com/goreleaser/goreleaser/releases/download/v0.135.0/goreleaser_Linux_x86_64.tar.gz"
wget -qO- --no-check-certificate ${URL} | tar zxvf - goreleaser; checkExit
chmod a+x goreleaser; checkExit

c_ok "Finished."
