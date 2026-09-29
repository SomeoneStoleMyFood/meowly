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
sleep 0.1
echo installing picker.py
curl -fsSL "https://raw.githubusercontent.com/SomeoneStoleMyFood/meowly/refs/heads/main/picker.py" -o ~/.config/fish/meowly/picker.py
echo installed
sleep 0.1
echo generating config file
mkdir -p ~/.config/meowly
mkdir -p ~/.config/fish/meowly/data/configs && cp ~/.config/fish/config.fish ~/.config/fish/meowly/data/configs/
cat << EOF > ~/.config/meowly/conf.json
{
  "default": "~/.config/fish/meowly/data/configs/"
}
EOF
echo generated
sleep 0.1
echo generating data file
cat << EOF > ~/.config/meowly/data.json
{
  "hello": "hi"
}
EOF
echo generated
sleep 0.1
echo configuring fish
CONFIG_PATH="$HOME/.config/fish/config.fish"
BIND_CODE='bind \cg "~/.config/fish/meowly/main.py foot; commandline -f repaint"'

if ! grep -qF "$BIND_CODE" "$CONFIG_PATH"; then
    echo "" >> "$CONFIG_PATH"
    echo "# bibi" >> "$CONFIG_PATH"
    echo "$BIND_CODE" >> "$CONFIG_PATH"
    echo "Binded $CONFIG_PATH"
else
    echo "already configured"
fi

sleep 0.1
echo rewriting config file
cat << EOF > ~/.config/meowly/conf.json
{
  "default": "~/.config/fish/meowly/data/configs/"
}
EOF
echo rewrited
sleep 0.1
echo chmod
chmod +x ~/.config/fish/meowly/main.py
chmod +x ~/.config/fish/meowly/picker.py
echo ok
sleep 0.1
echo installing depencies
pip install keyboard
echo installed
sleep 0.1
echo Installed meowly 1.0!
read -n 1 -s -r -p "Press any key to exit"