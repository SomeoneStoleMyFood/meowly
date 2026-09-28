#!/bin/sh
if [ "$(id -u)" -ne 0 ]; then
    echo "Meowly installer: Need root privileges to execute properly"
    exec sudo sh "$0" "$@"
fi

