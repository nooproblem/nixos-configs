{ config, lib, pkgs, nixosConfig, ... }:

{
  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "Christine Dodrill";
    userEmail = nixosConfig.cadey.git.email;
    ignores = [ "*~" "*.swp" "*#" ];
    delta.enable = true;
    extraConfig = {
      format.signoff = true;
      core.editor = "vim";
      credential.helper = "store --file ~/.git-credentials";
      protocol.keybase.allow = "always";
      init.defaultBranch = "main";
      pull.rebase = "true";

      url = {
        "git@github.com:".insteadOf = "https://github.com/";
        "git@ssh.tulpa.dev:".insteadOf = "https://tulpa.dev/";
      };
    };
  };
}
