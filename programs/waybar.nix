{ config, pkgs, ... }: 
let
  personal = import ../personal.nix;
  colors = import ../colors.nix;
in
{
  
  home.packages = with pkgs; [
    waybar
    font-awesome
  ];

  programs.wlogout = {
    enable = true;

    style = ''
    window {
      background-color: rgba(${colors.bg-rgb}, 0.5);
    }

    button {
      color: ${colors.fg-hex};
      background-color: ${colors.bg0-hex};
      border: 2px solid ${colors.bg0-hex};
      border-radius: 4px;
      background-repeat: no-repeat;
      background-position: center;
      background-size: 25%;
    }
    button:focus, button:active, button:hover {
      outline-style: none;
      border: 2px solid ${colors.blue1-hex};
    }
    
    #lock {
      background-image: image(url("/home/${personal.username}/.config/home-manager/assets/wlogout/lock.png"), url("/usr/local/share/wlogout/icons/lock.png"));
    }

    #logout {
      background-image: image(url("/home/${personal.username}/.config/home-manager/assets/wlogout/logout.png"), url("/usr/local/share/wlogout/icons/logout.png"));
    }

    #suspend {
      background-image: image(url("/home/${personal.username}/.config/home-manager/assets/wlogout/suspend.png"), url("/usr/local/share/wlogout/icons/suspend.png"));
    }

    #hibernate {
      background-image: image(url("/home/${personal.username}/.config/home-manager/assets/wlogout/hibernate.png"), url("/usr/local/share/wlogout/icons/hibernate.png"));
    }

    #shutdown {
      background-image: image(url("/home/${personal.username}/.config/home-manager/assets/wlogout/shutdown.png"), url("/usr/local/share/wlogout/icons/shutdown.png"));
    }

    #reboot {
        background-image: image(url("/home/${personal.username}/.config/home-manager/assets/wlogout/restart.png"), url("/usr/local/share/wlogout/icons/reboot.png"));
    }
    '';
  };

  programs.waybar = {
    enable = true;

    style = ''
      * {
        font-family: FontAwesome, Jetbrains Mono, Helvetica, Arial, sans-serif;
        font-size: 13px;
      }
      window#waybar {
        background: none;
      }
      #workspaces button {
        padding: 0 8px;
      }
      #workspaces,
      #window,
      #clock,
      #backlight,
      #network,
      #bluetooth,
      #pulseaudio,
      #battery,
      #tray,
      #custom-wlogout {
        background: ${colors.bg1-hex};
        color: ${colors.fg-hex};
        padding: 4px 8px;
        margin: 4px;
        border-radius: 4px;
      }
    '';

    settings.mainBar = {
      layer = "top";
      position = "top";

      modules-left = [ "clock" "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ ];
      modules-right = [ "backlight" "network" "bluetooth" "pulseaudio" "battery" "tray" "custom/wlogout" ];

      "hyprland/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        on-click = "activate";
        format = "{icon}";
        format-icons = {
          active = "";
          default = "";
        };
      };
      "hyprland/window" = {
        format = "{initialTitle}";
        tooltip = true;
        tooltip-format = "{title}";
      };
      "clock" = {
        interval = 60;
        tooltip = true;
        format = "{:%H:%M}";
        tooltip-format = "{:%d-%m-%Y}";
      };
      "backlight" = {
        format = "{icon}{percent}%";
        format-icons = [" " " "];
        tooltip = true;
        tooltip-format = "Backlight: {percent}%";
      };
      "network" = {
        format = "{ifname}";
        format-wifi = " {essid}";
        format-ethernet = " {essid}";
        format-disconnected = " ";
        tooltip-format = "{ifname}";
        tooltip-format-wifi = "{essid} ({signalStrength}%) ";
        tooltip-format-ethernet = "{ifname} ";
        tooltip-format-disconnected = "Disconnected";
        on-click = "nm-connection-editor";
      };
      "bluetooth" = {
        format = "";
        format-connected = " {device_alias}";
        tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
        tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
        on-click = "blueman-manager"; 
      };
      "pulseaudio" = {
        format = "{icon} {volume}%";
        format-muted = "";
        format-icons = {
          headphones = " ";
          handsfree = " ";
          headset = " ";
          phone = " ";
          portable = " ";
          car = " ";
          default = ["" " "];
        };
        scroll-step = 1;
        tooltip = true;
        tooltip-format = "{volume}% {desc}";
        max-length = 30;
        on-click = "pavucontrol";
      };
      "battery" = {
        interval = 60;
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-icons = [" " " " " " " " " "];
        tooltip = true;
        tooltip-format = "{capacity}%";
      };
      "tray" = {
        icon-size = 16;
        spacing = 10;
      };
      "custom/wlogout" = {
        format = " ";
        interval = "once";
        on-click = "wlogout -c 5 -r 5 -p layer-shell";
      };
    };
  };

}
  

