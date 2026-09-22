{ config, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "tablet";

  networking.networkmanager.enable = true;
  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  programs.hyprland.enable = true;
  # programs.niri.enable = true;

  programs.nix-ld.enable = true;
  programs.ssh.startAgent = true;

  virtualisation.podman.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true; 
 };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.liamh = {
    isNormalUser = true;
    description = "Liam Hanrahan";
    extraGroups = [ "networkmanager" "wheel" "input" "podman" ];
    packages = with pkgs; [];
  };

  security.sudo.wheelNeedsPassword = false;

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "liamh";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    hyprpolkitagent
  ];

  fonts.packages = with pkgs; [
    inter
    fira-code
    fira-code-symbols
    font-awesome
    jetbrains-mono
  ];

  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      sansSerif = ["Inter"];
      serif = ["Inter"];
      monospace = ["JetBrains Mono"];
    };
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };

  services.blueman.enable = true;

  security.polkit.enable = true;

  services.upower.enable = true;

  # services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;

#   services.udev.extraRules = ''
#     SUBSYSTEM=="input", KERNEL=="event*", ATTRS{name}=="ILIT2901:00 222A:5539", ENV{LIBINPUT_IGNORE_DEVICE}="1"
#   '';

  hardware.graphics.enable = true;

  system.stateVersion = "25.05";
}
