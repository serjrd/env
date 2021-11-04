#!/bin/bash

# This script sets up the desktop environment to my liking
# If it's the first time - run the 'console.sh' script first

# Add some custom repositories:
sudo add-apt-repository ppa:peterlevi/ppa					# variety
sudo add-apt-repository ppa:webupd8team/sublime-text-3		# sublime text 3
# Add Google Chrome PPA
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo bash -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

sudo apt-get update

# Install the soft that we need:
SOFT="variety sshfs vlc nmap mysql-server redis-server google-chrome-stable"
for pkg in $SOFT; do
	if dpkg -s "$pkg" >/dev/null 2>&1; then
		echo "$pkg is installed. OK."
	else
		echo "$pkg not installed. Installing $pkg"
		sudo apt install $pkg
	fi
done

# Install NPM packages that I need:
echo "Installing npm packages..."
sudo npm -g install coffeescript grunt-cli gyp sails stylus pm2

# add pm2 completions to zsh:
pm2 completion >> ~/.zshrc