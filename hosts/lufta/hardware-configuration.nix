# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules =
    [ "xhci_pci" "ahci" "nvme" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "rpool/safe/root";
    fsType = "zfs";
  };

  fileSystems."/nix" = {
    device = "rpool/local/nix";
    fsType = "zfs";
  };

  fileSystems."/home" = {
    device = "rpool/safe/home";
    fsType = "zfs";
  };

  fileSystems."/srv/within" = {
    device = "rpool/safe/srv/within";
    fsType = "zfs";
  };

  fileSystems."/var/lib/aura" = {
    device = "rpool/local/aura";
    fsType = "zfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8e7e8aed-d92c-4bbd-8d8e-318c8920740a";
    fsType = "ext4";
  };

  fileSystems."/var/lib/libvirt/images/pool" = {
    device = "rpool/safe/vm-images";
    fsType = "zfs";
  };

  fileSystems."/srv/certs" = {
    device = "rpool/safe/srv/certs";
    fsType = "zfs";
  };

  fileSystems."/srv/http" = {
    device = "rpool/safe/srv/http";
    fsType = "zfs";
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/23cb316c-06d8-4a74-86d2-0d2f7474ade2"; }];
}
