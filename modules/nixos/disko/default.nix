{
  lib,
  namespace,
  config,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.disko;
in
{
  options.${namespace}.disko = {
    enable = mkEnableOption "disko";
    layout = mkOption {
      type = types.enum [ "simple" ];
      default = "simple";
    };
    args = mkOption { type = types.attrs; };
  };

  config = mkIf config.${namespace}.disko.enable {
    inherit (import ./layouts/${cfg.layout}.nix cfg.args) disko;
  };
}
