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

    # Dunst
    services.dunst = {
      enable = true;
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
        size = "32x32";
      };
      settings = {
        global = {
          width = 300;
          height = 300;
          offset = "30x50";
          origin = "top-right";
          transparency = 10;
          frame_color = "${colors.bg-hex}";
          font = "DejaVu Sans";
        };
        urgency_normal = {
          background = "#37474f";
          foreground = "#eceff1";
          timeout = 10;
        };
      };
    };
}
