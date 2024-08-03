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
  cfg = config.${namespace}.programs.zsh;
in
{
  options.${namespace}.programs.zsh = {
    enable = mkEnableOption "zsh";
  };

  config = mkIf cfg.enable {
    programs = {
      zsh = {
        enable = true;
        enableCompletion = true;
        history = {
          ignoreSpace = true;
          path = "${config.xdg.dataHome}/zsh/zshistory";
        };
        syntaxHighlighting = enabled // {
          highlighters = [
            "main"
            "brackets"
          ];
        };
        oh-my-zsh = enabled // {
          extraConfig = ''
            zstyle ':omz:update' mode auto
            zstyle ':omz:update' frequency 1
            	  '';
          plugins = [ ];
        };
      };
    };
  };
}
