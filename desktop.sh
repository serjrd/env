#!/bin/bash

# This script sets up the desktop environment to my liking
# If it's the first time - run the 'console.sh' script first

# Add some custom repositories:
sudo add-apt-repository ppa:peterlevi/ppa					# variety
sudo add-apt-repository ppa:webupd8team/sublime-text-3		# sublime text 3
sudo apt-get update

# Install the soft that we need:
SOFT="variety sshfs clementine vlc nmap mysql-server sublime-text-installer redis-server"
for pkg in $SOFT; do
	if dpkg -s "$pkg" >/dev/null 2>&1; then
		echo "$pkg is installed. OK."
	else
		echo "$pkg not installed. Installing $pkg"
		sudo aptitude install $pkg
	fi
done


# Install NPM packages that I need:
echo "Installing npm packages..."
sudo npm -g install npm bower chai coffee-script grunt-cli gulp gyp js2coffee karma-cli mocha node-inspector protractor sails stylus


# Copy the custom configs:
echo "Fetch the config archive from your backup server manually :)"
