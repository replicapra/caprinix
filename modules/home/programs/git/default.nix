{
  lib,
  namespace,
  config,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.git;
in
{
  options.${namespace}.programs.git = {
    enable = mkEnableOption "git";
  };

  config = mkIf cfg.enable {
    programs = {
      git = enabled // {
        userEmail = "replicapra@outlook.com";
        userName = "replicapra";
        extraConfig = {
          user = {
            signingKey = "~/.ssh/id_ed25519.pub";
          };
          gpg.format = "ssh";
          commit.gpgSign = true;
          tag.gpgSign = true;
        };
      };
      lazygit = enabled;
      gh = enabled // {
        settings = {
          git_protocol = "ssh";
        };
      };
    };
  };
}
