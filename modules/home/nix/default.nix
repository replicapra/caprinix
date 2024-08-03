{
  lib,
  namespace,
  config,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.nix;
in
{
  options.nix = {
    gc = {
      # small workaround as it's called gc.dates
      # in nixos but gc.frequency in home-manger 
      dates = mkOption { type = types.str; };
    };
  };

  config = mkMerge [
    sharedNixConfig
    {
      nix = {
        checkConfig = true;
        gc = {
          automatic = true;
          frequency = cfg.gc.dates;
          options = "--delete-older-than 3d";
          persistent = true;
        };
      };
    }
  ];
}
