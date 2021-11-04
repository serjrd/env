#!/bin/bash

# This script sets up the working environment to my liking

# Add some PPAs:
wget -q https://deb.nodesource.com/setup_16.x -O - | sudo -E bash -
sudo apt update

# Install the soft that we need:
SOFT="nodejs zsh ack build-essential"
for pkg in $SOFT; do
	if dpkg -s "$pkg" >/dev/null 2>&1; then
		echo "$pkg is installed. OK."
	else
		echo "$pkg not installed. Installing $pkg"
		sudo apt install $pkg
	fi
done

# update zsh:
if [ ! -d ~/.oh-my-zsh ]; then
	echo "Getting oh-my-zsh"
	wget --no-check-certificate http://install.ohmyz.sh -O - | sh
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
	echo "Fetching syntax-highlight"
	(cd ~/.oh-my-zsh/custom/plugins && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git)
fi

echo "Setting up the custom theme"
if [ ! -d ~/.oh-my-zsh/custom/themes ]; then
	mkdir ~/.oh-my-zsh/custom/themes
fi
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cp $DIR/serjrd.zsh-theme ~/.oh-my-zsh/custom/themes

echo "Updating ~/.zshrc"
sed -ir 's/^[# ]*ZSH_THEME=.*$/ZSH_THEME="serjrd"/g' ~/.zshrc
sed -ir 's/^plugins=.*/plugins=(command-not-found git zsh-syntax-highlighting)/g' ~/.zshrc

echo 'alias more="less"' >> ~/.zshrc

echo "Setting zsh to be the default shell"
USERNAME=${SUDO_USER:-$USER}
sudo usermod -s /bin/zsh $USERNAME

echo "Generating 'ru' locale"
/usr/sbin/locale-gen ru
