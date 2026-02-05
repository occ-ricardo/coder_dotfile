#!/bin/bash

###########################################
### UPDATES
###########################################
#sudo apt update
#sudo apt -y full-upgrade
#sudo apt autoremove



###########################################
### INSTALLS
###########################################
# Install nano and ping
#sudo apt install nano iputils-ping
# Install DBeaver Community
#if [ -f /home/coder/Downloads/dbeaver-ce_24.2.2_amd64.deb ]; then
#    sudo dpkg -i /home/coder/Downloads/dbeaver-ce_24.2.2_amd64.deb
#fi
# Install MongoDB Compass
#if [ -f /home/coder/Downloads/mongodb-compass_1.44.4_amd64.deb ]; then
#    sudo dpkg -i /home/coder/Downloads/mongodb-compass_1.44.4_amd64.deb
#fi



###########################################
### ENVIRONMENT VARIABLES
###########################################
sudo sh -c 'printf "\n# SPRING BOOT ENVIRONMENT\nSPRING_APP_ENV=dev\n" >> /etc/environment'



###########################################
### BASH
###########################################
# ALIAS step 1 - .profile setup to invoke .bashrc
cat <<'EOF' > /home/coder/.profile
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
EOF

# ALIAS step 2 - .bashrc setup
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

### JAVA
jv()  { java -version; }
jvv() { java -XshowSettings:all -version; }  # verbose version of -version
j11() {
  sudo update-alternatives --set java  /usr/lib/jvm/java-11-openjdk-amd64/bin/java  >/dev/null
  sudo update-alternatives --set javac /usr/lib/jvm/java-11-openjdk-amd64/bin/javac >/dev/null
  java -version
}
j17() {
  sudo update-alternatives --set java  /usr/lib/jvm/java-17-openjdk-amd64/bin/java  >/dev/null
  sudo update-alternatives --set javac /usr/lib/jvm/java-17-openjdk-amd64/bin/javac >/dev/null
  java -version
}
j21() {
  sudo update-alternatives --set java  /usr/lib/jvm/java-21-openjdk-amd64/bin/java  >/dev/null
  sudo update-alternatives --set javac /usr/lib/jvm/java-21-openjdk-amd64/bin/javac >/dev/null
  java -version
}
j25() {
  sudo update-alternatives --set java  /usr/lib/jvm/java-25-openjdk-amd64/bin/java  >/dev/null
  sudo update-alternatives --set javac /usr/lib/jvm/java-25-openjdk-amd64/bin/javac >/dev/null
  java -version
}
EOF

# AUTOCOMPLETION
#sudo apt install bash-completion
#echo 'if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi' >> /home/coder/.bashrc



###########################################
### APACHE MAVEN (IN UPDATE-ALTERNATIVES)
###########################################
# Create the /opt/maven directory
sudo mkdir -p /opt/maven
cd /opt/maven

# Download desired versions
#sudo wget https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
#sudo wget https://archive.apache.org/dist/maven/maven-3/3.9.7/binaries/apache-maven-3.9.7-bin.tar.gz
#sudo wget https://archive.apache.org/dist/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.tar.gz
#sudo wget https://archive.apache.org/dist/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
#sudo wget https://archive.apache.org/dist/maven/maven-3/3.9.10/binaries/apache-maven-3.9.10-bin.tar.gz
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.11/binaries/apache-maven-3.9.11-bin.tar.gz
sudo wget https://dlcdn.apache.org/maven/maven-4/4.0.0-rc-4/binaries/apache-maven-4.0.0-rc-4-bin.tar.gz

# Extract them
#sudo tar -xzf apache-maven-3.9.6-bin.tar.gz
#sudo tar -xzf apache-maven-3.9.7-bin.tar.gz
#sudo tar -xzf apache-maven-3.9.8-bin.tar.gz
#sudo tar -xzf apache-maven-3.9.9-bin.tar.gz
#sudo tar -xzf apache-maven-3.9.10-bin.tar.gz
sudo tar -xzf apache-maven-3.9.11-bin.tar.gz
sudo tar -xzf apache-maven-4.0.0-rc-4-bin.tar.gz

# Clean up archives
sudo rm apache-maven-*-bin.tar.gz

# Registers maven versions in updates-alternatives
#sudo update-alternatives --install /usr/bin/mvn maven /opt/maven/apache-maven-3.9.6/bin/mvn 396
#sudo update-alternatives --install /usr/bin/mvn maven /opt/maven/apache-maven-3.9.7/bin/mvn 397
#sudo update-alternatives --install /usr/bin/mvn maven /opt/maven/apache-maven-3.9.8/bin/mvn 398
#sudo update-alternatives --install /usr/bin/mvn maven /opt/maven/apache-maven-3.9.9/bin/mvn 399
#sudo update-alternatives --install /usr/bin/mvn maven /opt/maven/apache-maven-3.9.10/bin/mvn 3910
sudo update-alternatives --install /usr/bin/mvn maven /opt/maven/apache-maven-3.9.11/bin/mvn 3911
sudo update-alternatives --install /usr/bin/mvn maven /opt/maven/apache-maven-4.0.0-rc-4/bin/mvn 4000

# If the need arises to remove a version
#sudo update-alternatives --remove maven /opt/maven/apache-maven-3.9.11/bin/mvn
#sudo update-alternatives --remove maven /opt/maven/apache-maven-4.0.0-rc-4/bin/mvn



###########################################
### ICONS
###########################################
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