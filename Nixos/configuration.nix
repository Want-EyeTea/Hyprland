#----=[ QUICK JUMP ]----#

# PACKAGES: 142
# SERVICES: 265
# ENVIRONMENT VARIABLES: 343
# PRINTER: 94
# SOUND: 111

#----==========================----#

{ config, lib, pkgs, ... }:

  #----=[ VARIABLES ]=----#

let
  unstable = import <unstable> {};
in

  #----==========================----#
  
{
  # CONFIGURATION TITLE ( This does nothing )
  boot.loader.grub.configurationName = "Hyprland_PERFECT";


  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  #----=[ BOOT CONFIGURATION ]=----#

  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/a3a4c4da-a290-4ac6-a093-5662b2a3b394";

  #----==========================----#


  #----=[ NETWORKING ]=----#
  
  networking.hostName = "nixos"; # Define your hostname.
  # Pick only ONE of the below networking options.

  ## Wireless
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  ## Store Wireless Connection:
  #networking.wireless.networks = {
  #  "" = {
  #    hidden = true;
  #    psk = "";
  #  };
  #};

  ## LAN 
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  
  ## VPN
  

  ## PROXY SETTINGS
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  #----==========================----#

  #----=[ LANGUAGE FORMATTING ]=----#

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  #----==========================----#

  #----=[ PRINTER SETTINGS ]=----#

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable Auto-Detect
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Install Drivers
  services.printing.drivers = [ pkgs.brgenml1cupswrapper pkgs.brgenml1lpr ];

  #----==========================----#

  #----=[ SOUND ]=----#

  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  #----==========================----#


  #----=[ USERS & GROUPS ]=----#

  # Define Users
  users.users.admin = {
    initialPassword = "nimda"; # You will change this after initial install
    isNormalUser = true;
    group = "admin";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "docker" ]; 
    packages = with pkgs; [
    ];
  };
  # Define Groups
  users.groups.admin = {};

  #----==========================----#
  
  #----=[ PACKAGES ]=----#

  # Allow Open-Source Packages
  nixpkgs.config.allowUnfree = true;

  # Allowed Insecure Packages
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
    "electron-29.4.0"
  ];

  # Package Overrides (Adding the NUR repository)
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };


  environment.systemPackages = with pkgs; [
    firefox
    chromium
    tree
    neovim    
    python313
    wget
    git
    dig
    nmap
    floorp 	# Web testing browser
    feh		# image viewer
    cifs-utils
    networkmanagerapplet
    obsidian 	# Note-taking
    iconpack-obsidian
    openvpn
    networkmanager-openvpn
    signal-desktop
    zellij	# Multiplexer
    gimp	# Image Manipulation
    docker
    docker-compose
    ripgrep	# Better grep
    libreoffice-fresh
    pipx
    nodePackages.npm
    zoxide # Better cd
    netcat-openbsd
    google-chrome
    veracrypt
    gcc
    sublime
    file
    pipenv
    eza		# Better ls
    bat   	# Better cat
    obs-studio
    killall
    zoom-us
    waydroid  # Android Emulator
    nur.repos.ataraxiasjel.waydroid-script
    android-tools
    xdg-utils
    unstable.zig_0_12
    # Web Testing 
    feroxbuster
    ffuf
    amass
    # Strongswan VPN Packages
    strongswan
    networkmanager_strongswan
    networkmanager-l2tp
    # HYPRLAND SPECIFIC PKGS #
    waybar # Utility Bar
    mako	# Notification Daemon
    wofi	# Application Manager
    kitty	# Terminal
    swaybg	# wallpaper manager
    cliphist	# clipboard manager
    grim
    nwg-look
    pamixer
    pavucontrol
    slurp
    starship
    swappy
    swaylock
    xfce.thunar
    wlogout
    pyprland
    gtk3
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
    xsel
    wl-clipboard
    wlroots
    brightnessctl
    brillo
    gnome3.adwaita-icon-theme
  ];

  #----==========================----#

  #----=[ FONTS ]=----#

  fonts.packages = with pkgs; [
    font-awesome
    noto-fonts-emoji
    nerdfonts
  ];
  fonts.enableDefaultPackages = true;
  fonts.fontconfig.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  #----==========================----#

  #----=[ SERVICES ]=----#

  # List services to enable:

  #----=( OPENSSH )=----#
  services.openssh.enable = true;

  #----=( XSERVER )=----#
  services.xserver.upscaleDefaultCursor = true;
  services.xserver.dpi = true;

  #----=( STRONGSWAN )=----#
  services.strongswan.enable = true;
  services.strongswan.secrets = ["/etc/ipsec.d/ipsec.nm-l2tp.secrets"];

  #----=( DOCKER )=----#
  virtualisation.docker.enable = true;

  #----=( FLATPAK )=----#
  services.flatpak.enable = true;
  
  ### Install Flathub Repo:
  # flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

  ### Install Apps:
  # flatpak install flathub com.bitwarden.desktop

  #----=( WAYDROID )=----#
  virtualisation.waydroid.enable = true;

  #----=( TOUCHPAD SUPPORT )=----#
  # services.xserver.libinput.enable = true;

  #----==========================----#

  #----=[ FIREWALL ]=----#

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  #----==========================----#
  
  #----=[ NIXOS VERSION ]=----#

  system.stateVersion = "24.05";

  #----==========================----#

  #----=[ HYPRLAND ]=----#

  programs.hyprland = {
    # Install packages from nixpkgs
    enable = true;
    # Enable XWayland
    xwayland.enable = true;
  };
  
  ## Desktop Portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  #----==========================----#

  #----=[ SWAYLOCK SETTINGS ]=----#

  ## Enable Polkit
  security.polkit.enable = true;

  ## Set PAM settings

  security.pam.services.swaylock = {};
  security.pam.services.swaylock.fprintAuth = false;

  #----==========================----#

  #----=[ ENVIRONMENT VARIABLES ]=----#

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  environment.variables.XCURSOR_SIZE = "24";
  environment.variables.XCURSOR_THEME = "Adwaita";
  environment.variables.XDG_DATA_DIRS = "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";

  #----==========================----#

  #----=[ GRAPHICS ]=----#
  hardware = {
    # Opengl
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  
  };
}

