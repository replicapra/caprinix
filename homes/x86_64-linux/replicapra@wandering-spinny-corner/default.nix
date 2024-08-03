{ lib, namespace, ... }:
with lib;
with lib.${namespace};
{

  caprinix = {
    programs = {
      git = enabled;
      zsh = enabled;
    };
  };

  home.stateVersion = "24.05";
}
