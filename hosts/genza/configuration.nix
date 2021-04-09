{ config, pkgs, lib, ... }:

let
  metadata =
    pkgs.callPackage /home/cadey/code/nixos-configs/ops/metadata/peers.nix { };
in {
  imports = [
    ./hardware-configuration.nix
    /home/cadey/code/nixos-configs/common/users
    /home/cadey/code/nixos-configs/common/base.nix
    /home/cadey/code/nixos-configs/common/desktop.nix
    <home-manager/nixos>
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.devNodes = "/dev/disk/by-partuuid";

  networking.hostName = "genza"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.hostId = "bddd8eb7";
  services.tailscale.enable = true;

  time.timeZone = "America/Toronto";

  networking.useDHCP = false;
  networking.interfaces.wlp2s0.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver.libinput.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;

  home-manager.users.cadey =
    (import /home/cadey/code/nixos-configs/common/users/cadey/gui.nix);

  environment.systemPackages = with pkgs; [
    wget
    vim
    firefox
    file
    gimp
    openssl
    unrar
    slack
    wireguard
    tailscale
  ];

  programs.mtr.enable = true;
  services.openssh.enable = true;

  networking.firewall.enable = false;
  system.stateVersion = "20.09";

  networking.wireguard.interfaces.akua =
    metadata.hosts."${config.networking.hostName}";

  cadey = {
    discord.enable = true;
    dwm.enable = true;
    gui.enable = true;
    git.email = "xe@tailscale.com";
    kde.enable = true;
    sway = {
      enable = true;
      i3status = true;
      output = {
        "eDP-1" = {
          res = "1920x1080";
          pos = "0,0";
          bg = "~/Pictures/Baphomet-wallpaper7.jpg.png fill";
        };
      };
    };
  };

  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];

  users.users.mai.isSystemUser = true;
  users.users.vic.isSystemUser = true;

  boot.kernelPackages = pkgs.linuxPackages_5_10;

  services.zfs.autoScrub.enable = true;
  services.zfs.autoSnapshot.enable = true;
}

