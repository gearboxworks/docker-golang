#!/bin/sh

# See gearboxworks/gearbox-base for details.
test -f /build/include-me.sh && . /build/include-me.sh

c_ok "Started."

c_ok "Installing packages."
APKS="$(cat /build/build-template.apks)"
apk update && apk add --no-cache ${APKS}; checkExit

c_ok "Finished."
