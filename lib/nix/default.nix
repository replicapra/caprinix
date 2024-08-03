{ ... }:
{
  sharedNixConfig = {
    nix = {
      checkConfig = true;
      gc = {
        dates = "daily";
        options = "--delete-older-than 3d";
        automatic = true;
        persistent = true;
      };
    };
  };
}
