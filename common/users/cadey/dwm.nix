{ config, pkgs, ... }:

let
  wp = ./cadey_seaside_wp.png;
  nur = import <nur> { inherit pkgs; };
in {
  home.packages = with pkgs; [ dmenu ];

  home.file = {
    ".dwm/autostart.sh" = {
      executable = true;
      text = ''
        #!/bin/sh

        ${pkgs.feh}/bin/feh --bg-scale ${wp}
        ${pkgs.compton}/bin/picom &
        ${pkgs.pasystray}/bin/pasystray &
        ${nur.repos.xe.cabytcini}/bin/cabytcini &
      '';
    };
  };
}
