{
  lib,
  namespace,
  config,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.neovim;
in
{
  options.${namespace}.programs.neovim = {
    enable = mkEnableOption "nvim";
  };

  config = mkIfEnabled cfg {
    programs = {
      neovim = enabled // {
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
      };
    };
  };
}
