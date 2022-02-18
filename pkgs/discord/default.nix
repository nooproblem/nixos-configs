{ branch ? "stable", pkgs }:
# Generated by ./update-discord.sh
let
  inherit (pkgs) callPackage fetchurl;
in {
  stable = callPackage ./base.nix rec {
    pname = "discord";
    binaryName = "Discord";
    desktopName = "Discord";
    version = "0.0.17";
    src = fetchurl {
      url = "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
      sha256 = "058k0cmbm4y572jqw83bayb2zzl2fw2aaz0zj1gvg6sxblp76qil";
    };
  };
  ptb = callPackage ./base.nix rec {
    pname = "discord-ptb";
    binaryName = "DiscordPTB";
    desktopName = "Discord PTB";
    version = "0.0.29";
    src = fetchurl {
      url = "https://dl-ptb.discordapp.net/apps/linux/${version}/discord-ptb-${version}.tar.gz";
      sha256 = "11si5hs9pv1rf1vj5g84d87s4zd0ly7ar1y9ggil4ckp0sfhvgvp";
    };
  };
  canary = callPackage ./base.nix rec {
    pname = "discord-canary";
    binaryName = "DiscordCanary";
    desktopName = "Discord Canary";
    version = "0.0.133";
    src = fetchurl {
      url = "https://dl-canary.discordapp.net/apps/linux/${version}/discord-canary-${version}.tar.gz";
      sha256 = "0wx8wkgkzvw9094baa3dni834l0n4p6ih024bj1851sgwwnidb0a";
    };
  };
}
