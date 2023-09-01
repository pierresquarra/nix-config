{ config, pkgs, ... }: 
let
  personal = import ./personal.nix;
in
{

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
    username = "${personal.username}";
    homeDirectory = "/home/${personal.username}";
    stateVersion = "23.05";

    packages = with pkgs; [
      wofi
      dunst
      firefox
      obsidian
      discord
      xfce.thunar
      neofetch
      spotify

      # Development
      vscode
      nodejs
      filezilla

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
      EDITOR = "code";
      GTK_THEME = "Grubox-dark";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
