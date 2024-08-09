{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.services.openssh;
in
{
  options.${namespace}.services.openssh = {
    enable = mkEnableOption "openssh";
  };

  config = mkIfEnbled cfg {
    services = {
      openssh = enabled // {
        settings = {
          X11Forwarding = false;
          UseDns = true;
          PermitRootLogin = "no";
          PasswordAuthentication = false;
        };
        extraConfig = ''
          PubkeyAuthentication yes
          PermitEmptyPasswords no
          ChallengeResponseAuthentication no
          PermitUserEnvironment no
          AllowAgentForwarding no
          AllowTcpForwarding no
          PermitTunnel no
          ClientAliveInterval 300
        '';
      };
      fail2ban = enabled;
    };
  };
}
