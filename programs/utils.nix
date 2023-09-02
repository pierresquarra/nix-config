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

    # Wofi
    programs.wofi = {
      enable = true;
      settings = {
        show = "drun";
	allow_images = true;
	width = "25%";
	height = "25%";
	no_actions = true;
	prompt = "";
      };
      style = ''
        window {
	  border-radius: 4px;
	}
      '';
    };
}
