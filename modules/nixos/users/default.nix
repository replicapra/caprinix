{ pkgs, ... }:
{
  users.users.replicapra = {
    isNormalUser = true;
    initialPassword = "capra";
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
