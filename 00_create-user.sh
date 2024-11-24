useradd -m -s /bin/bash inv
passwd inv
usermod -a -G sudo inv

apt install gnome-tweaks terminator htop mc git curl

#gsettings set org.gnome.mutter draggable-border-width 15

/* Place this text into ~/.config/gtk.css */

window.csd:not(.popup)>decoration{
  border: 3px solid blue;
  box-shadow: 0 0 0 3px yellow;
 }


/*
decoration,window.csd {
    border: 3px solid magenta;
}
*/

decoration {
border:3px solid yellow;
}

headerbar.titlebar {
    border-top: 2px solid darkgray;
    border-left: 2px solid darkgray;
    border-right: 2px solid darkgray;
}

