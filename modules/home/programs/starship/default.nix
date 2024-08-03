{
  lib,
  config,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.starship;
  format = import ./format.nix;
  palettes = import ./palettes.nix;
in
{
  options.${namespace}.programs.starship = {
    enable = mkEnableOption "starship promt";
  };

  config = mkIfEnabled cfg {
    programs.starship = enabled // {
      enableZshIntegration = true;
      settings = {
        sudo = {
          disabled = false;
          format = "[$symbol]($style)";
          symbol = "!";
        };
        format = concatStrings format;
        fill = {
          symbol = " ";
        };
        palette = "catppuccin_mocha";
        palettes = palettes;
      };
    };
  };
}
