{ config, pkgs, ... }:
let
  colors = import ../colors.nix;
in
{
    # PDF viewer
    programs.zathura = {
        enable = true;
        options = {
            default-bg = "${colors.bg0-hex}";
            default-fg = "${colors.fg-hex}";
        };
    };

    # Image viewer
    programs.imv = {
        enable = true;
        settings = {
            options.background = "${colors.bg0-hex}";
        };
    };
}