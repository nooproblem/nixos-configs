{ config, pkgs, ... }:

let
  nur-no-pkgs = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {};
in {
  imports = with nur-no-pkgs.repos.xe.modules; [
    ./dev.nix
    ./dhall.nix
    ./git.nix
    ./k8s.nix
    #./nixops.nix
    ./pastebins
    ./spacemacs
    ./fish
    ./vim

    htop
    neofetch
    tmux
  ];

  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;

    packageOverrides = import ../../../pkgs;

    manual.manpages.enable = false;
  };
}
