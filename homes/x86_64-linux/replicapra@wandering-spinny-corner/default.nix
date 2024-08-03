{ lib, namespace, ... }:
with lib;
with lib.${namespace};
{

  caprinix = {
    programs = {
      git = enabled;
      zsh = enabled;
      atuin = enabled;
      starship = enabled;
      tmux = enabled;
    };
  };

  home.stateVersion = "24.05";
}
