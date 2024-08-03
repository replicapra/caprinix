{
  config,
  pkgs,
  namespace,
  lib,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.home-manager.users.replicapra.${namespace}.programs.zsh;
in
{
  config = mkIf cfg.enable {
    users.users.replicapra.shell = pkgs.zsh;
    programs.zsh = enabled;
  };
}
