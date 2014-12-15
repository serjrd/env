#!/bin/sh

# This script sets up the working environment to my liking

# aptitude:
if !dpkg -s "aptitude" >/dev/null 2>&1; then
	echo "Installing aptitude"
#	sudo apt-get install aptitude
fi

# Install the soft that we need:
SOFT="nodejs git zsh"
for pkg in $SOFT; do
	if dpkg -s "$pkg" >/dev/null 2>&1; then
		echo "$pkg is installed. OK."
	else
		echo "$pkg not installed. Installing $pkg"
#		sudo aptitude install $pkg
	fi
done


# update zsh:
if [ -d ~/.oh-my-zsh ]; then
	echo "Getting oh-my-zsh"
#	wget --no-check-certificate http://install.ohmyz.sh -O - | sh
fi

if [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
	echo "Fetching syntax-highlight"
#	cd ~/.oh-my-zsh/custom/plugins && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
fi

echo "Setting up the custom theme"
#mkdir ~/.oh-my-zsh/custom/themes
#cp ./serjrd.zsh-theme ~/.oh-my-zsh/custom/themes

echo "Updating ~/.zshrc"
#sed -ir 's/^[# ]*ZSH_THEME=.*$/ZSH_THEME="serjrd"/g' ~/.zshrc
#sed -ir 's/^plugins=.*/plugins=(git zsh-syntax-highlighting)/g' ~/.zshrc

echo "Setting zsh to be the default shell"
#sudo chsh -s /bin/zsh
