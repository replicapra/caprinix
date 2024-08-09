{
  config,
  lib,
  namespace,
  system,
  inputs,
  ...
}:
with lib;
with lib.${namespace};
let
  hostname = config.networking.hostName;
  secretsPath = toString inputs.caprinix-secrets;
  systemSecretsPath = "${secretsPath}/systems/${system}/${hostname}";
in
{
  config = {
    sops = {
      defaultSopsFile = "${systemSecretsPath}/secrets.yaml";
      validateSopsFiles = true;

      age = {
        sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
        keyFile = "/var/lib/sops-nix/key.txt";
        generateKey = true;
      };

      secrets = {
        "replicapra/password" = {
          neededForUsers = true;
        };
        "ssh_id/private" = {
          sopsFile = "${systemSecretsPath}/ssh/id_ed25519.sops";
          format = "binary";
          path = "/home/replicapra/.ssh/id_ed25519";
          owner = "replicapra";
          mode = "0700";
        };
        "ssh_id/public" = {
          sopsFile = "${systemSecretsPath}/ssh/id_ed25519.pub.sops";
          format = "binary";
          path = "/home/replicapra/.ssh/id_ed25519.pub";
          owner = "replicapra";
          mode = "0744";
        };
        "ssh_host/private" = {
          sopsFile = "${systemSecretsPath}/ssh/ssh_host_ed25519_key.sops";
          format = "binary";
          path = "/etc/ssh/ssh_host_ed25519_key";
        };
        "ssh_host/public" = {
          sopsFile = "${systemSecretsPath}/ssh/ssh_host_ed25519_key.pub.sops";
          format = "binary";
          path = "/etc/ssh/ssh_host_ed25519_key.pub";
          mode = "0744";
        };
      };
    };
  };
}
