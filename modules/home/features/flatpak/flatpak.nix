{ self, inputs, ... }: {

  flake.homeModules.flatpak = {

    services.flatpak = {
      enable = true;
    };
    
    imports = [
      self.homeModules.flatpakapps
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ];

  };
}
