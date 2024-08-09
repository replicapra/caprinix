{ pkgs, config, ... }:
{
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
