# List of Apps
installs=(
  "extra/bat",
  "extra/bind",
  "extra/docker",
  "extra/eza",
  "extra/fd",
  "extra/fzf",
  "core/less",
  "extra/lf",
  "extra/luarocks",
  "extra/man-pages-es",
  "extra/neovim",
  "extra/nodejs",
  "extra/npm",
  "core/openssh",
  "core/python",
  "extra/python-openpyxl",
  "extra/python-pandas",
  "extra/ranger",
  "extra/ripgrep",
  "extra/starship",
  "extra/unzip",
  "extra/vim",
  "extra/wget",
  "extra/whois",
  "extra/zellij",
  "core/net-tools"
)

for i in "${installs[@]}"; do
  sudo pacman -Sy $i; done

echo -e "\nAll packages installed!"
