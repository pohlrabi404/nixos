{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./keyd.nix
    ./sway.nix
  ];

  # time zone
  time.timeZone = "Japan";

  # state version
  system.stateVersion = "24.11";

  # systemd boot
  boot.loader.systemd-boot.enable = true;

  # enable openssh
  services.sshd.enable = true;

  # limit generations
  boot.loader.systemd-boot.configurationLimit = 5;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  # optimize store
  nix.settings.auto-optimise-store = true;

  # flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # users
  users.users.pohlrabi = {
    isNormalUser = true;
    description = "Purple Kohlrabi";
    home = "/home/pohlrabi";
    extraGroups = [
      "networkmanager"
      "wheel"
      "seat"
      "video"
      "input"
      "greeter"
    ];
  };

  # network
  networking.networkmanager.enable = true;
  networking.hostName = "work";

  # system packages
  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  # default shell
  environment.shells = with pkgs; [ nushell ];
  users.defaultUserShell = pkgs.nushell;

  # font
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  i18n.defaultLocale = "en_US.UTF-8";
}
