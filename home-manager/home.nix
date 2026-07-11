{ config, lib, pkgs, dotfiles, ... }:

let
  optionalPkg = path: lib.attrByPath path null pkgs;
  available = builtins.filter (pkg: pkg != null);
in {
  home.username = "manan";
  home.homeDirectory = "/home/manan";
  home.stateVersion = "25.05";

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "terraform"
    ];

  programs.home-manager.enable = true;
  xdg.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = "$HOME/";
    download = "$HOME/downloads";
    documents = "$HOME/";
    music = "$HOME/";
    pictures = "$HOME/";
    publicShare = "$HOME/";
    templates = "$HOME/";
    videos = "$HOME/";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    NNN_FIFO = "/tmp/nnn.fifo";
    NNN_PLUG = "p:preview-tui";
    PNPM_HOME = "$HOME/.local/share/pnpm";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.local/share/pnpm"
    "/usr/local/go/bin"
  ];

  home.packages = with pkgs; [
    alsa-utils
    bc
    brightnessctl
    curl
    fuzzel
    gcc
    git
    gnumake
    go
    kitty
    mako
    mdcat
    mpv
    neovim
    (nnn.override { withNerdIcons = true; })
    opencode
    playerctl
    ripgrep
    starship
    tmux
    uv
    waybar
    wl-clipboard
    xclip
    xdg-utils
  ] ++ available [
    (optionalPkg [ "niri" ])
    (optionalPkg [ "pnpm" ])
    (optionalPkg [ "swaylock-effects" ])
    (optionalPkg [ "terraform" ])
    (optionalPkg [ "urlview" ])
    (optionalPkg [ "nerd-fonts" "fira-code" ])
    (optionalPkg [ "nerd-fonts" "iosevka" ])
  ];

  programs.firefox = {
    enable = true;
    configPath = ".mozilla/firefox";

    policies = {
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };

        "addon@darkreader.org" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
        };

        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
        };

        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
        };
      };
    };

    profiles.manan = {
      id = 0;
      isDefault = true;

      settings = {
        "browser.download.dir" = "${config.home.homeDirectory}/downloads";
        "browser.download.folderList" = 2;
        "browser.download.useDownloadDir" = true;

        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;
        "browser.toolbars.bookmarks.visibility" = "never";

        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "layout.css.prefers-color-scheme.content-override" = 0;
        "ui.systemUsesDarkTheme" = 1;

        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
      };
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = [ "ignoreboth" ];
    historyFileSize = 2000;
    historySize = 1000;
    shellOptions = [ "checkwinsize" "histappend" ];

    shellAliases = {
      alert = "notify-send --urgency=low -i terminal 'command finished'";
      gc = "git commit -m";
      gd = "git diff --cached";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";
      grep = "grep --color=auto";
      gs = "git status";
      l = "ls -CF";
      la = "ls -A";
      ll = "ls -alF";
      ls = "ls --color=auto";
      tasks = "clear && mdcat ~/dox/tasks.md";
      todo = "clear && mdcat ~/dox/todo.md";
      vim = "nvim";
    };

    initExtra = ''
      set -o vi
      bind -m vi-insert "\C-l":clear-screen

      if [ -x /usr/bin/lesspipe ]; then
        eval "$(SHELL=/bin/sh lesspipe)"
      fi

      if [ -f "$HOME/.bash_aliases" ]; then
        . "$HOME/.bash_aliases"
      fi

      if [ -f "$HOME/.secrets" ]; then
        . "$HOME/.secrets"
      fi

      f ()
      {
          [ "''${NNNLVL:-0}" -eq 0 ] || {
              echo "nnn is already running"
              return
          }

          export NNN_TMPFILE="''${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
          command nnn -ex "$@"

          [ ! -f "$NNN_TMPFILE" ] || {
              . "$NNN_TMPFILE"
              rm -f -- "$NNN_TMPFILE" > /dev/null
          }
      }

      if command -v terraform >/dev/null 2>&1; then
        complete -C "$(command -v terraform)" terraform
      fi

      if [ -f "$HOME/.local/bin/env" ]; then
        . "$HOME/.local/bin/env"
      fi

      eval "$(starship init bash)"
    '';
  };

  xdg.configFile = {
    "fuzzel/fuzzel.ini".source = "${dotfiles}/home/.config/fuzzel/fuzzel.ini";
    "kitty".source = "${dotfiles}/home/.config/kitty";
    "mako/config".source = "${dotfiles}/home/.config/mako/config";
    "mpv".source = "${dotfiles}/home/.config/mpv";
    "niri/config.kdl".source = "${dotfiles}/home/.config/niri/config.kdl";
    "nvim".source = "${dotfiles}/home/.config/nvim";
    "starship.toml".source = "${dotfiles}/home/.config/starship.toml";
    "swaylock/config".source = "${dotfiles}/home/.config/swaylock/config";
    "tmux/tmux.conf".source = "${dotfiles}/home/.config/tmux/tmux.conf";
    "waybar".source = "${dotfiles}/home/.config/waybar";
  };

  home.file = {
    ".local/bin/bat" = {
      source = "${dotfiles}/bin/bat";
      executable = true;
    };
    ".local/bin/bri" = {
      source = "${dotfiles}/bin/bri";
      executable = true;
    };
    ".local/bin/catbox" = {
      source = "${dotfiles}/bin/catbox";
      executable = true;
    };
    ".local/bin/music" = {
      source = "${dotfiles}/bin/music";
      executable = true;
    };
    ".local/bin/tmux-session" = {
      source = "${dotfiles}/bin/tmux-session";
      executable = true;
    };
    ".local/bin/vol" = {
      source = "${dotfiles}/bin/vol";
      executable = true;
    };
  };
}
