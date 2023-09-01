{ config, lib, pkgs, ... }: {

  # Gtk
  gtk = {
    enable = true;

    font = {
      package = pkgs.jetbrains-mono;
      name = "jetbrains-mono";
    };

    theme = {
      package = pkgs.gruvbox-dark-gtk;
      name = "gruvbox-dark";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };

  };

  # Qt
  qt = {
    enable = true;
    platformTheme = "gtk";
  };

}
