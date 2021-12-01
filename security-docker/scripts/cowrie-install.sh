#!/bin/bash

# Install Cowrie dependencies
apt-get install git python-virtualenv libssl-dev libffi-dev build-essential libpython3-dev python3-minimal authbind virtualenv

# Add cowrie user
## cowrie cannot run as root and should never run as one
adduser --disabled-password cowrie
su - cowrie

# Clone the repository
git clone http://github.com/cowrie/cowrie

# Setup virtual environment
cd cowrie
virtualenv --python=python3 cowrie-env
source cowrie-env/bin/activate
pip install --upgrade pip
pip install --upgrade -r requirements.txt

# Set configuration
mkdir log
cd etc/
touch cowrie.cfg
cat > cowrie.cfg << EOF
[ssh]
enabled=true
listen_port=2222
listen_endpoints = tcp:62222:interface=0.0.0.0
[output_jsonlog]
enabled=true
logfile=log/cowrie.json
[output_textlog]
enabled=true
logfile=log/audit.log
format=text
EOF