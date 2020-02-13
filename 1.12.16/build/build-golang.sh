#!/bin/sh

# See gearboxworks/gearbox-base for details.
test -f /build/include-me.sh && . /build/include-me.sh

c_ok "Started."

# chown -fhR gearbox:gearbox /var/cache/nginx /var/log/nginx /etc/nginx /usr/lib/nginx /usr/sbin/nginx /usr/share/nginx

c_ok "Finished."
