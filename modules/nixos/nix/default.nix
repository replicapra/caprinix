{ lib, namespace, ... }:
with lib;
with lib.${namespace};
{
  config = mkMerge [
    sharedNixConfig

    {
      nix = {
        checkAllErrors = true;
        settings = {
          auto-optimise-store = true;
        };
        optimise = {
          dates = [ "daily" ];
          automatic = true;
        };
      };
    }
  ];

}
