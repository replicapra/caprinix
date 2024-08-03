{
  lib,
  namespace,
  config,
  pkgs,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.core;
in
{
  options.${namespace}.programs.core = {
    enable = mkEnableOption "core programs";
  };

  config = mkIfEnabled cfg {
    programs = {

    };

    home.packages = with pkgs; [
      ripgrep
      jq
      jc
      unzip
      zip
    ];
  };
}
