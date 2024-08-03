{
  lib,
  config,
  namespace,
  pkgs,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.tmux;
in
{
  options.${namespace}.programs.tmux = {
    enable = mkEnableOption "tmux";
  };
  config = mkIfEnabled cfg {
    programs = {
      tmux = enabled // {
        baseIndex = 1;
        clock24 = true;
        mouse = true;
        keyMode = "vi";
        prefix = "C-t";
        shell = mkIfEnabled config.${namespace}.programs.zsh "${pkgs.zsh}/bin/zsh";
        terminal = "screen-256color";
        tmuxinator = enabled;
        tmuxp = enabled;
      };
    };
  };
}
