{ lib, namespace, ... }:
with lib;
with lib.${namespace};
{

  caprinix = {
    programs = {
      core = enabled;
      git = enabled;
      zsh = enabled;
      atuin = enabled;
      starship = enabled;
      tmux = enabled;
      neovim = enabled;
    };
  };

  home.stateVersion = "24.05";
}
