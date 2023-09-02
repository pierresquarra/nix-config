{config, pkgs, ...}: {

  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };

    theme = "Gruvbox Dark Hard";
  };

}