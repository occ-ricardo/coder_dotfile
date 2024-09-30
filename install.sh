#!/bin/bash

# Update Ubuntu repository
sudo apt update
sudo apt -y full-upgrade
sudo apt autoremove

# Install nano
sudo apt install nano
