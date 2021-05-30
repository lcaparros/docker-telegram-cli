#!/bin/bash

set -e

if [ -n "$SHELLINABOX_USER" ] && ! id -u "$SHELLINABOX_USER" >/dev/null 2>&1; then
	echo "creating user: $SHELLINABOX_USER"
	if [ -n "$SHELLINABOX_ALLOW_SUDO" ]; then
		useradd -m -g users -G sudo $SHELLINABOX_USER
	else
		useradd -m -g users $SHELLINABOX_USER
	fi
	# set user password
	if [ -n "$SHELLINABOX_PASSWORD" ]; then
		echo "set password for user: $SHELLINABOX_USER"
		echo "$SHELLINABOX_USER:$SHELLINABOX_PASSWORD" | chpasswd
	fi
fi
unset SHELLINABOX_PASSWORD

declare cmd="shellinaboxd --user shellinabox --group shellinabox --disable-ssl"

echo "Starting: $cmd"
#eval $cmd

while true; do echo "Ctrl-C to stop"; done