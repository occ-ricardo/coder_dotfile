#!/bin/bash


### UPDATES
# Update Ubuntu repository
sudo apt update
sudo apt -y full-upgrade
sudo apt autoremove


### INSTALLS
# Install nano
sudo apt install nano
# Install ping
sudo apt install iputils-ping
# Install DBeaver Community
if [ -f /home/coder/Downloads/dbeaver-ce_24.2.2_amd64.deb ]; then
    sudo dpkg -i /home/coder/Downloads/dbeaver-ce_24.2.2_amd64.deb
fi
# Install MongoDB Compass
if [ -f /home/coder/Downloads/mongodb-mongosh_2.3.2_amd64.deb ]; then
    sudo dpkg -i /home/coder/Downloads/mongodb-mongosh_2.3.2_amd64.deb
fi


### ICONS
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


### ALIAS
echo 'if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi' > /home/coder/.profile
echo '### NAVIGATION' > /home/coder/.bashrc
echo 'alias ll="ls -l"' >> /home/coder/.bashrc
echo 'alias la="ls -la"' >> /home/coder/.bashrc
echo 'alias cls="clear && echo -en \e[3J"' >> /home/coder/.bashrc
echo '' >> /home/coder/.bashrc
echo '### KUBERNETES' >> /home/coder/.bashrc
echo 'alias k="kubectl"' >> /home/coder/.bashrc
echo 'alias pods="kubectl get pods"' >> /home/coder/.bashrc
echo 'alias svc="kubectl get svc"' >> /home/coder/.bashrc
echo '' >> /home/coder/.bashrc
echo '### SKAFFOLD' >> /home/coder/.bashrc
echo 'alias s="skaffold"' >> /home/coder/.bashrc


### BASH AUTOCOMPLETION
sudo apt install bash-completion
echo 'if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi' >> /home/coder/.bashrc