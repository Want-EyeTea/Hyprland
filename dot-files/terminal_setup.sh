# List of Apps
installs=(
  "extra/git",
  "nvim",
  "starship",
  "rg"
  "fd"
  )

for $i in ${installs[@]}; do
  sudo pacman -Sy $i; done
