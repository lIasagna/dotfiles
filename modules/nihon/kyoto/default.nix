{ self, inputs, ... }: {

  flake.nixosConfigurations.kyoto = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.kyotoConfig
    ];
  };  
}
