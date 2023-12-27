useradd -m -s /bin/bash inv
passwd inv
usermod -a -G sudo inv

apt install gnome-tweaks terminator htop mc git curl

#gsettings set org.gnome.mutter draggable-border-width 15
