#!/bin/bash

sudo apt-get update
sudo apt-get -y install wget gnupg2 gnupg-agent dirmngr cryptsetup scdaemon pcscd secure-delete hopenpgp-tools yubikey-personalization libssl-dev swig libpcsclite-dev python3-pip python3-pyscard

#pip3 install PyOpenSSL yubikey-manager
