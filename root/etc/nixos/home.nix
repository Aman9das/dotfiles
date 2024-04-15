{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "aman";
  home.homeDirectory = "/home/aman";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  # xresources.properties = {
  #   "Xcursor.size" = 16;
  #   "Xft.dpi" = 172;
  # };

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Aman Das";
    userEmail = "amandas62640@gmail.com";
    extraConfig = { safe.directory = "/etc/nixos"; };
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    neofetch # system information
    usbutils # lsusb

    firefox # web browser
    thunderbird # mail client
    libreoffice-fresh

    quarto # Pandoc
    ( rstudioWrapper.override { packages = with rPackages; [ rmarkdown ggplot2 ]; } ) # RStudio
  
  ];

  services.flatpak = {
    packages = [
      "flathub:com.github.tchx84.Flatseal//stable"
    ];
  };

  # Bash Config
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
    '';
  };

  # VSCodium config
  programs.vscode = {
    package = pkgs.vscodium;
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
    ];
  };

  # Github config
  programs.gh.enable = true;

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
