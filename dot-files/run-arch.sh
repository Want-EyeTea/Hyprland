# Create Config Directory
mkdir ~/.config
#
sleep 2
# 
# Install required packages
yay -Syy ; yay -S extra/bitwarden extra/cifs-utils extra/cliphist core/dosfstools extra/feh aur/firefox-esr-bin aur/floorp-bin extra/git extra/grim extra/gtk3 extra/gvfs extra/hyprland extra/kitty core/less extra/lxappearance extra/mako core/man-db core/man-pages extra/neovim extra/network-manager-applet core/nfs-utils extra/noto-fonts-emoji extra/nvidia-dkms extra/nvidia-settings extra/nwg-look extra/obsidian extra/obsidian-icon-theme extra/openvpn extra/networkmanager-openvpn extra/pacman-contrib extra/pamixer extra/pavucontrol extra/polkit-gnome extra/python-requests extra/qt5-graphicaleffects extra/qt5-quickcontrols2 extra/qt5-svg extra/qt5-wayland extra/qt5ct extra/qt6ct extra/signal-desktop extra/slurp extra/starship extra/swappy extra/swaybg extra/swaylock extra/thunar extra/ttf-font-awesome extra/ttf-jetbrains-mono-nerd extra/waybar extra/wireplumber extra/wl-clipboard aur/wlogout extra/wofi aur/xdg-desktop-portal-hyprland-git extra/xfce4-settings extra/zellij extra/ripgrep extra/libreoffice-fresh extra/gimp extra/docker extra/docker-compose extra/python-pipx aur/pyrpland extra/npm extra/z extra/webkit2gtk extra/openbsd-netcat extra/alsa-firmware core/coreutils extra/galculator extra/kanshi extra/kvantum multilib/lib32-pipewire-jack extra/libgsf extra/libopenraw extra/librsvg core/libtool core/net-tools aur/networkmanager-support extra/nm-connection-editor extra/noto-fonts extra/noto-fonts-cjk extra/ntfs-3g extra/otf-font-awesome aur/otf-font-awesome-4 extra/p7zip core/pciutils extra/pipewire-jack aur/pipewire-support extra/plasma-framework5 extra/ranger extra/xdg-desktop-portal extra/xorg-xwayland extra/xsel aur/pyprland aur/google-chrome extra/veracrypt

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
