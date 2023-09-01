{ config, pkgs, ... }: {

  nixpkgs.config.allowUnfreePredicate = (pkg: true);
  fonts.fontconfig.enable = true;

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  imports = [
    ./programs
  ];

  home = {
    username = "pierre";
    homeDirectory = "/home/pierre";
    stateVersion = "23.05";

    packages = with pkgs; [
      kitty
      wofi
      dunst
      firefox
      obsidian
      discord
      xfce.thunar
      neofetch
      spotify
      vscode

      zathura

      # Utils
      unzip
      networkmanagerapplet
      imv # Image viewer
      zathura # PDF viewer

      # Screenshots
      imagemagick
      grim
      slurp 

      # Audio
      pavucontrol
      
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    # You can also manage environment variables but you will have to manually
    # source
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/pierre/etc/profile.d/hm-session-vars.sh
    #
    # if you don't want to manage your shell through Home Manager.
    sessionVariables = {
      # EDITOR = "emacs";
      GTK_THEME = "Grubox-Material-Dark-Hard";
    };
  };

  # Git
  programs.git = {
    enable = true;
    userName = "pierresquarra";
    userEmail = "pierre@squarra.de";
  };

  # Kitty
  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.jetbrains-mono;
      name = "jetbrains-mono";
    };

    theme = "Gruvbox Material Dark Hard";
  };

  # Gnome
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
