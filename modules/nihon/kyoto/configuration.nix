{ self, inputs, ... }: {
  
  flake.nixosModules.kyotoConfig = { config, lib, pkgs, ... }: {

    imports = [
        self.nixosModules.kyotoHardware
        self.nixosModules.niri
	self.nixosModules.bluetooth
	self.nixosModules.noctalia-greeter
      ];
    
    sevices.greetd = {
      enable = true;
    };  

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
      prism-launcher
    ];

    fonts.packages = with pkgs; [
      inter
      jetbrains-mono

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.11";

  };
}
