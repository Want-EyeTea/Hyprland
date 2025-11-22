# List of Apps
installs=(
  "extra/git"
  "extra/neovim"
  "extra/starship"
  "extra/eza"
  "extra/ripgrep-all"
  "extra/zellij"
  "extra/bat"
  "core/less"
  "core/python"
)

for i in "${installs[@]}";
  do sudo pacman -Sy $i
done


