#!/bin/sh
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS_NAME="$PRETTY_NAME"
else
    OS_NAME="Unknown Linux"
fi

echo detected $OS_NAME
echo updating system...
if [ "$ID" = "arch" ]; then
    sudo pacman -Syu
    sudo pacman -S git
else
    echo 'only arch suported for now! :('
fi

shell_name=$(basename "$SHELL")
echo "Current shell name: $shell_name"
if [ "$shell_name" = "fish" ]; then
    sh ./assets/inst.sh
else
    exit 1
fi