#!/bin/bash

# Install Cowrie dependencies
apt-get install git python-virtualenv libssl-dev libffi-dev build-essential libpython3-dev python3-minimal authbind virtualenv

# Add cowrie user
## cowrie cannot run as root and should never run as one
su - cowrie

# Clone the repository
git clone http://github.com/cowrie/cowrie

# Setup virtual environment
cd cowrie
virtualenv --python=python3 cowrie-env
source cowrie-env/bin/activate
pip install --upgrade pip
pip install --upgrade -r requirements.txt
exit
echo "Cowrie installed succesfully"
exit
# Dont forget to add the configuration in the dockerfile commands!