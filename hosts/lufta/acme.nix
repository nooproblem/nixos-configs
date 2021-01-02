{ pkgs, ... }:

let
  creds = pkgs.writeTextFile {
    name = "cloudflare.env";
    text = builtins.readFile ./secret/acme-cf.env;
  };

in {
  security.acme.certs."tulpa.dev" = {
    group = "nginx";
    email = "me@christine.website";
    dnsProvider = "cloudflare";
    credentialsFile = "${creds}";
    extraDomainNames = [ "lufta.tulpa.dev" ];
  };

  security.acme.certs."christine.website" = {
    group = "nginx";
    email = "me@christine.website";
    dnsProvider = "cloudflare";
    credentialsFile = "${creds}";
    extraDomainNames = [ "*.christine.website" ];
  };

  security.acme.certs."cetacean.club" = {
    group = "nginx";
    email = "me@christine.website";
    dnsProvider = "cloudflare";
    credentialsFile = "${creds}";
    extraDomainNames =
      [ "*.cetacean.club" "*.kahless.cetacean.club" "*.lufta.cetacean.club" ];
  };

  security.acme.certs."tulpanomicon.guide" = {
    group = "nginx";
    email = "me@christine.website";
    dnsProvider = "cloudflare";
    credentialsFile = "${creds}";
    extraDomainNames = [ "tulpaforce.xyz" ];
  };

  security.acme.certs."within.website" = {
    group = "nginx";
    email = "me@christine.website";
    dnsProvider = "cloudflare";
    credentialsFile = "${creds}";
    extraDomainNames = [ "*.within.website" ];
  };

  security.acme.certs."xeserv.us" = {
    group = "nginx";
    email = "me@christine.website";
    dnsProvider = "cloudflare";
    credentialsFile = "${creds}";
    extraDomainNames = [
      "*.xeserv.us"
      "*.greedo.xeserv.us"
      "*.apps.xeserv.us"
      "*.minipaas.xeserv.us"
    ];
  };
}
