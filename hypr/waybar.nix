{ config, lib, pkgs, ... }: {
  
  home.packages = with pkgs; [
    waybar
    font-awesome
  ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "wlr/workspaces" ];
        modules-center = [ "custom/hello-from-waybar" ];
        modules-right = [ "custom/mymodule#with-css-id" "temperature" ];

        "wlr/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
	  on-click = "activate";
        };
        "custom/hello-from-waybar" = {
          format = "hello {}";
          max-length = 40;
          interval = "once";
          exec = pkgs.writeShellScript "hello-from-waybar" ''
            echo "from within waybar"
          '';
        };
      };
    };
  };

}
  

