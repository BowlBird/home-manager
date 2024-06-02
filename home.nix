{ config, pkgs, ... }:

{
  # info
  home.username = "bowlbird";
  home.homeDirectory = "/home/bowlbird";

  # DO NOT CHANGE UNLESS STATED BY HOME MANAGER
  home.stateVersion = "24.05";

  # User packages 
  home.packages = with pkgs; [
    hello zsh oh-my-zsh git zsh-autosuggestions fzf
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
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

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/bowlbird/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    XDG_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    FZF_DEFAULT_COMMAND = "find . ";
    LD_LIBRARY_PATH = "/usr/local/lib";
    PIPEWIRE_LATENCY = "256/48000";
    GODOT4 = "godot-mono";
  };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
    
    zsh = {
      enable = true;
      enableCompletion = true;
      autocd = true;
      history = {
        ignoreAllDups = true;
      };

      autosuggestion = {
        enable = true;
      };

      syntaxHighlighting = {
        enable = true;
      }; 

      shellAliases = {
        update = "yay";
      };

      oh-my-zsh = {
        enable = true;
        theme = "terminalparty";
        plugins = [
          "git"
          "fzf"
        ];
      };
    };
  };
}
