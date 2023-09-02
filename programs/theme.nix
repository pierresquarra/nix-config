{ config, pkgs, ... }: {

  # Gtk
  gtk = {
    enable = true;

    font = {
      package = pkgs.jetbrains-mono;
      name = "JetBrains Mono Bold";
    };

    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox-Dark-BL";
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
