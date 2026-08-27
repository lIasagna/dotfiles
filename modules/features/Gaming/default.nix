{ self, inputs, ... }: {
  
  flake.nixosModules.gaming = {
    imports = [
      self.nixosModules.prismlauncher
      self.nixosModules.steam
    ];
  };  
}
