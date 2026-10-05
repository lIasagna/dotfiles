{ self, inputs, ... }: {
  
  flake.nixosModules.kyotoConfig = { config, lib, pkgs, ... }: {


    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
      "osu-lazer-bin"
    ];  

    imports = [
        self.nixosModules.home-manager
        self.nixosModules.kyotoHardware
	self.nixosModules.gaming
        self.nixosModules.niri
	self.nixosModules.bluetooth
	self.nixosModules.noctalia-greeter
	self.nixosModules.mousePatch
	self.nixosModules.firewall
        self.nixosModules.environment
        self.nixosModules.portals
        self.nixosModules.wmenu
      ];
    
    services.greetd = {
      enable = true;
    };  

    services.keyd = {
      enable = true;
      keyboards = {
        logitech = {
	  ids = [];
	};
      };
    };  

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "kyoto";

    networking.networkmanager.enable = true;

    time.timeZone = "America/New_York";

    users.users.kageumi = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      packages = with pkgs; [
        tree
      ];
    };
   
    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
      neovim
      wget
      git
      gh
      yazi
      vesktop
      ghostty
      anki-bin
      grim
      slurp
      wl-clipboard
      solaar
      nodejs
      gnome-network-displays
      osu-lazer-bin
      bitwarden-desktop
    ];



    fonts.packages = with pkgs; [
      inter
      jetbrains-mono
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.11";

  };
}
