# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

#----=[ DECLARING NIX VARIABLES ]=----#

{
  # CONFIGURATION TITLE (This doesn't work)
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
  boot.initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/fc5c925c-e877-4bad-bcb9-b2c7faa08472";

  #----==========================----#


  #----=[ NETWORKING ]=----#
  
  networking.hostName = "nixos"; # Define your hostname.
  # Pick only ONE of the below networking options.

  ## Wireless
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Store Wireless Connection:
  networking.wireless.networks = {
    "" = {
      hidden = true;
      psk = "";
    };
  };

  ## LAN 
  #networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  
  ## VPN
  

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  #----==========================----#

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

  #----=[ PRINTING SETTINGS ]=----#

  # Enable CUPS to print documents.
  # services.printing.enable = true;

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
  # hardware.pulseaudio.enable = true;

  #----==========================----#

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  #----=[ USERS & GROUPS ]=----#

  # Define Users. Don't forget to set a password with ‘passwd’.
  users.users.admin = {
    initialPassword = "nimda";
    isNormalUser = true;
    group = "admin";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
     firefox
     tree
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

  # List packages installed in system profile. To search, run:
  # $ nix search PACKAGE_NAME

  environment.systemPackages = with pkgs; [
    neovim    
    wget
    git
    bitwarden	# password manager
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
    z-lua
    netcat-openbsd
    google-chrome
    veracrypt
    gcc
    sublime
    file
    pipenv
    eza		# Better ls
    bat   # Better cat
    # Web Testing 
    feroxbuster
    ffuf
    amass
    # Strongswan VPN Packages
    strongswan
    networkmanager_strongswan
    networkmanager-l2tp
    # HYPRLAND SPECIFIC PKGS #
    waybar
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

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.xserver.upscaleDefaultCursor = true;
  services.xserver.dpi = true;

  # Strongswan Specific
  services.strongswan.enable = true;
  services.strongswan.secrets = ["/etc/ipsec.d/ipsec.nm-l2tp.secrets"];

  # Flatpak
  services.flatpak.enable = true;
  
  #----==========================----#

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

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

  ## Hardware Settings
  hardware = {
    # Opengl
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  
  };

}

