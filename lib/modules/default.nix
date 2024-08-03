{ lib, ... }:
with lib;
{
  enabled = {
    enable = true;
  };

  disabled = {
    enable = false;
  };

  mkIfEnabled = option: content: mkIf (option.enable) content;
}
