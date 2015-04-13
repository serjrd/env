#!/bin/bash

# This script install aptitude and git and runs console.sh
# The script is meant to be run directly from the remote URL: wget URL -O - | sh -

# aptitude:
if ! dpkg -s "aptitude" >/dev/null 2>&1; then
	echo "Installing aptitude"
	sudo apt-get install aptitude
fi

sudo aptitude install git
cd ~
git clone https://github.com/serjrd/env.git
~/env/console.sh