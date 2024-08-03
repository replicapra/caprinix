{
  lib,
  namespace,
  config,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.atuin;
in
{
  options.${namespace}.programs.atuin = {
    enable = mkEnableOption "atuin";
  };

  config = mkIfEnabled cfg {
    programs = {
      atuin = enabled // {
        enableZshIntegration = true;
        settings = {
          style = "full";
          sync_frequency = "5m";
          filter_mode = "global";
          filter_mode_shell_up_key_binding = "session";
        };
      };
    };
  };
}
