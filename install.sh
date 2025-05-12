#!/bin/bash


### UPDATES
# Update Ubuntu repository
sudo apt update
#sudo apt -y full-upgrade
#sudo apt autoremove


### INSTALLS
# Install nano and ping
sudo apt install nano iputils-ping
# Install DBeaver Community
#if [ -f /home/coder/Downloads/dbeaver-ce_24.2.2_amd64.deb ]; then
#    sudo dpkg -i /home/coder/Downloads/dbeaver-ce_24.2.2_amd64.deb
#fi
# Install MongoDB Compass
#if [ -f /home/coder/Downloads/mongodb-compass_1.44.4_amd64.deb ]; then
#    sudo dpkg -i /home/coder/Downloads/mongodb-compass_1.44.4_amd64.deb
#fi


### ICONS
# Create IntelliJ IDEA CE desktop icon
# echo '[Desktop Entry]
# Version=1.0
# Type=Application
# Name=IntelliJ IDEA Community Edition
# Icon=/opt/idea/bin/idea.svg
# Exec="/opt/idea/bin/idea.sh" %f
# Comment=Capable and Ergonomic IDE for JVM
# Categories=Development;IDE;
# Terminal=false
# StartupWMClass=jetbrains-idea-ce
# StartupNotify=true' > /home/coder/.local/share/applications/jetbrains-idea-ce.desktop


### ALIAS
# .profile setup
cat <<'EOF' > /home/coder/.profile
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
EOF

# .bashrc setup
cat <<'EOF' > /home/coder/.bashrc
### NAVIGATION
alias ll="ls -l"
alias la="ls -la"
alias cls="clear && printf '\e[3J'"

### KUBERNETES
alias k="kubectl"
alias pods="kubectl get pods"
alias svc="kubectl get svc"
alias pvc="kubectl get pvc"

### SKAFFOLD
alias s="skaffold"
EOF


### BASH AUTOCOMPLETION
#sudo apt install bash-completion
#echo 'if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi' >> /home/coder/.bashrc