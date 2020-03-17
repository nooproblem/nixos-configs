{ config, lib, pkgs, ... }:

{
  services.lorri.enable = true;
  home.packages = with pkgs; [ cachix niv nixfmt mosh gist bind ];

  programs.direnv.enable = true;
  programs.direnv.enableFishIntegration = true;
}
