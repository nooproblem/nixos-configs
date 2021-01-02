{ config, pkgs, lib, ... }:

with lib;

let cfg = config.within.services.withinwebsite;
in {
  options.within.services.withinwebsite = {
    enable = mkEnableOption "Enables the within.website import redirector";

    domain = mkOption {
      type = types.str;
      default = "within.website";
      example = "within.website";
      description =
        "The domain name that nginx should check against for HTTP hostnames";
    };

    port = mkOption {
      type = types.int;
      default = 52838;
      example = 9001;
      description =
        "The port number withinwebsite should listen on for HTTP traffic";
    };
  };

  config = mkIf cfg.enable {
    users.users.withinwebsite = {
      createHome = true;
      description = "within.website";
      isSystemUser = true;
      group = "within";
      home = "/srv/within/withinwebsite";
    };

    systemd.services.withinwebsite = {
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        User = "withinwebsite";
        Group = "within";
        Restart = "on-failure";
        WorkingDirectory = "/srv/within/withinwebsite";
        RestartSec = "30s";
      };

      script = let ww = pkgs.x.withinwebsite;
      in ''
        exec ${ww}/bin/withinwebsite -port=${toString cfg.port}
      '';
    };

    services.cfdyndns.records = [ "${cfg.domain}" ];

    services.nginx.virtualHosts."withinwebsite" = {
      serverName = "${cfg.domain}";
      locations."/".proxyPass = "http://127.0.0.1:${toString cfg.port}";
      forceSSL = true;
      useACMEHost = "within.website";
    };
  };
}
