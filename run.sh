# Install required packages
yay -S extra/bitwarden extra/cifs-utils extra/cliphist core/dosfstools extra/feh aur/firefox-esr-bin aur/floorp-bin extra/git extra/grim extra/gtk3 extra/gvfs extra/hyprland extra/kitty core/less extra/lxappearance extra/mako core/man-db core/man-pages extra/neovim extra/network-manager-applet core/nfs-utils extra/noto-fonts-emoji extra/nvidia-dkms extra/nvidia-settings extra/nwg-look extra/obsidian extra/obsidian-icon-theme extra/openvpn extra/networkmanager-openvpn extra/pacman-contrib extra/pamixer extra/pavucontrol extra/polkit-gnome extra/pulseaudio extra/python-requests extra/qt5-graphicaleffects extra/qt5-quickcontrols2 extra/qt5-svg extra/qt5-wayland extra/qt5ct extra/qt6ct extra/signal-desktop extra/slurp extra/starship extra/swappy extra/swaybg extra/swaylock extra/thunar extra/ttf-font-awesome extra/ttf-jetbrains-mono-nerd extra/waybar extra/wireplumber extra/wl-clipboard aur/wlogout extra/wofi extra/xdg-desktop-portal-hyprland extra/exfce4-settings extra/zellij extra/ripgrep extra/libreoffice-fresh extra/gimp extra/docker extra/docker-compose extra/python-pipx aur/pyrpland extra/npm extra/z extra/webkit2gtk extra/openbsd-netcat

sleep 2

# Overwrite .bashrc file
cp ./.bashrc ~/

# Copy over config files
sleep 2
cp -r ./hypr/ ~/.config/
sleep 2
cp -r ./kitty/ ~/.config/
sleep 2
cp -r ./nwg-look/ ~/.config/
sleep 2
cp -r ./swaylock/ ~/.config/
sleep 2
cp -r ./waybar/ ~/.config/
sleep 2
cp -r ./wofi/ ~/.config/
sleep 2
cp -r ./zellij/ ~/.config/
sleep 2 
cp -r ./nvim/ ~/.config/
#
echo "Setup completed!"
