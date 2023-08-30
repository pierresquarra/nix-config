{ config, lib, pkgs, ... }: {
  
  home.packages = with pkgs; [
    waybar
    font-awesome
  ];

  programs.wlogout = {
    enable = true;
  };

  programs.waybar = {
    enable = true;

    style = ''
      * {
	font-family: FontAwesome, Jetbrains Mono, Helvetica, Arial, sans-serif;
	font-size: 13px;
      }
      #workspaces button {
        padding: 0 8px;
      }
      #clock,
      #backlight,
      #network,
      #bluetooth,
      #pulseaudio,
      #battery,
      #tray,
      #custom-wlogout {
        padding: 0 10px;
      }
    '';

    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      spacing = 5;
      margin-left = 10;
      margin-right = 10;

      modules-left = [ "wlr/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "backlight" "network" "bluetooth" "pulseaudio" "battery" "tray" "custom/wlogout" ];

      "wlr/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        on-click = "activate";
	format = "{icon}";
	format-icons = {
  	  active = "";
	  default = "";
  	};
      };
      "clock" = {
        interval = 60;
  	tooltip = true;
  	format = "{:%H:%M}";
  	tooltip-format = "{:%d-%m-%Y}";
      };
      "backlight" = {
  	format = "{icon}";
  	format-icons = ["" ""];
	tooltip = true;
	tooltip-format = "Backlight: {percent}%";
      };
      "network" = {
  	format = "{ifname}";
  	format-wifi = "";
  	format-ethernet = "";
  	format-disconnected = "";
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
        format = "{icon}";
  	format-muted = "";
  	format-icons = {
  	  headphones = "";
  	  handsfree = "";
	  headset = "";
	    phone = "";
	    portable = "";
	    car = "";
	    default = ["" ""];
  	};
  	scroll-step = 1;
	tooltip = true;
	tooltip-format = "{volume}% {desc}";
  	on-click = "pavucontrol";
      };
      "battery" = {
        interval = 60;
  	states = {
	  warning = 30;
  	  critical = 15;
  	};
	format = "{icon}";
  	format-icons = ["" "" "" "" ""];
	tooltip = true;
	tooltip-format = "{capacity}%";
      };
      "tray" = {
        icon-size = 16;
  	spacing = 10;
      };
      "custom/wlogout" = {
        format = "";
        interval = "once";
        on-click = "wlogout -c 5 -r 5 -p layer-shell";
      };
    };
  };

}
  

