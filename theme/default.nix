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
      package = pkgs.gruvbox-dark-gtk;
      name = "gruvbox-dark-icons-gtk";
    };
  };

  # Qt
  qt = {
    enable = true;

    platformTheme = "gtk";

    style = {
      package = pkgs.adwaita-qt;
      name = "adwaita-dark";
    };
  };

}
