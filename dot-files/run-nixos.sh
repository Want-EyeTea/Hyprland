# Create Config Directory
mkdir ~/.config
#

# Overwrite .bashrc file
cp ./.bashrc ~/

# Copy over config files
sleep 2
echo "Copying Hyprland config..."
cp -r ./hypr/ ~/.config/
sleep 2
echo "Copying Kitty config..."
cp -r ./kitty/ ~/.config/
sleep 2
echo "Copying Nwg-Look config..."
cp -r ./nwg-look/ ~/.config/
sleep 2
echo "Copying Swaylock config..."
cp -r ./swaylock/ ~/.config/
sleep 2
echo "Copying Waybar config..."
cp -r ./waybar/ ~/.config/
sleep 2
echo "Copying Wofi config..."
cp -r ./wofi/ ~/.config/
sleep 2
echo "Copying Zellij config..."
cp -r ./zellij/ ~/.config/
sleep 2 
echo "Copying Nvim config..."
cp -r ./nvim/ ~/.config/
sleep 2 
echo "Copying GTK-3.0 config..."
cp -r ./gtk-3.0/ ~/.config/
sleep 2
echo "Copying Starship config..."
cp ./starship.toml ~/.config/
#
echo ""
echo "Setup completed!"
