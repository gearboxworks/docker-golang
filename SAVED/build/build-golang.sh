#!/bin/sh

# See gearboxworks/gearbox-base for details.
test -f /build/include-me.sh && . /build/include-me.sh

c_ok "Started."

c_ok "Installing packages."
if [ -f /build/build-golang.apks ]
then
	APKS="$(cat /build/build-golang.apks)"
	if [ "${APKS}" != "" ]
	then
		apk update && apk add --no-cache ${APKS}; checkExit
	fi
fi

if [ -f /build/build-golang.env ]
then
	. /build/build-golang.env
fi

if [ ! -d /usr/local ]
then
	mkdir -p /usr/local; checkExit
fi

# curl --silent --show-error --fail --location --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - ${URL}
cd /usr/local
# wget -qO- --no-check-certificate ${URL} | tar zxf - ; checkExit

if [ ! -f /usr/local/go/bin/go ]
then
	c_err "Failed to find /usr/local/go/bin/go"
else
	chmod a+x /usr/local/go/bin/go; checkExit
	/usr/local/go/bin/go version; checkExit
fi

c_ok "Finished."


################################################################################
#apk add --no-cache openssh-server openrc sshfs sshpass
#mkdir -p /var/run/sshd
#cp /build/rootfs/etc/ssh/sshd_config /etc/ssh/sshd_config
#cp /build/rootfs/etc/environment /etc/environment
#cp /etc/environment /home/gearbox/.ssh/environment
## PermitUserEnvironment
#
#/usr/bin/ssh-keygen -A
## sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin without-password/' /etc/ssh/sshd_config
#usermod --password '$6$UjTMGicK9jD/e3HP$opw6IVubBkcwLVELdFU3D7SJhAmM9yDgLrTpQ7a6vqBXPLUa2Z.ZFTUX624WDpl7JZe08EE5V5SPChtRA67J4.' gearbox
#echo 'export PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' > /etc/profile
