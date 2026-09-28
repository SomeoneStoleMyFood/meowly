#!/bin/sh
echo removing dir if it exists
sleep 0.1
if [ -d "$HOME/.config/fish/meowly" ]; then
    rm -rf "$HOME/.config/fish/meowly"
    echo "deleted"
else
    echo "clean install"
fi
sleep 0.1
echo creating dir
mkdir -p ~/.config/fish/meowly
echo succes
sleep 0.1
echo installing main.py
curl -fsSL "https://raw.githubusercontent.com/SomeoneStoleMyFood/meowly/refs/heads/main/main.py" -o ~/.config/fish/meowly/main.py
echo installed