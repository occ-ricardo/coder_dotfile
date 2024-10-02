#!/bin/bash

# Update Ubuntu repository
sudo apt update
sudo apt -y full-upgrade
sudo apt autoremove

# Install nano
sudo apt install nano
# Install dbeaver-ce
sudo dpkg -i /home/coder/Downloads/dbeaver-ce_24.2.1_amd64.deb

# Create IntelliJ IDEA CE desktop icon
echo '[Desktop Entry]
Version=1.0
Type=Application
Name=IntelliJ IDEA Community Edition
Icon=/opt/idea/bin/idea.svg
Exec="/opt/idea/bin/idea.sh" %f
Comment=Capable and Ergonomic IDE for JVM
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-idea-ce
StartupNotify=true' > /home/coder/.local/share/applications/jetbrains-idea-ce.desktop

# Alias
echo 'if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi' > /home/coder/.profile
echo 'alias ll="ls -l"' > /home/coder/.bashrc
echo 'alias la="ls -la"' >> /home/coder/.bashrc
echo 'alias cls="clear && echo -en \e[3J"' >> /home/coder/.bashrc
