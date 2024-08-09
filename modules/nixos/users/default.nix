{ pkgs, config, ... }:
{
  users.mutableUsers = false;

  users.users.replicapra = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."replicapra/password".path;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      neovim
      git
    ];
  };
}
