{ config, pkgs, ... }:

let
  nur-no-pkgs = import (builtins.fetchTarball
    "https://github.com/nix-community/NUR/archive/master.tar.gz") { };
in {
  imports = with nur-no-pkgs.repos.xe.modules; [
    ./dwm.nix
    ./front
    ./keybase.nix
    ./media.nix
    ./obs.nix
    ./st
    ./xresources.nix
    ./urxvt.nix

    #luakit
    #zathura
  ];

  home.packages = with pkgs; [
    krita
    virtmanager
    github.com.nomad-software.meme
  ];

  home.file = {
    "bin/memegen" = {
      executable = true;
      text = with pkgs;
        let meme = github.com.nomad-software.meme;
        in ''
          #!/usr/bin/env bash

          ${xclip}/bin/xclip -selection clipboard -t image/png -i $(${meme}/bin/meme -i "$1" -t "$2")
        '';
    };

    "bin/shakememe" = {
      executable = true;
      text = with pkgs;
        let meme = github.com.nomad-software.meme;
        in ''
          #!/usr/bin/env bash

          ${xclip}/bin/xclip -selection clipboard -t image/gif -i $(${meme}/bin/meme -gif -shake -i "$1" -t "$2")
        '';
    };
  };
}
