{ self, inputs, ... }: {

  flake.homeModules.flatpak = {

    services.flatpak = {
      enable = true;
    };
    
    import = [
      self.homeModules.flapakapps
    ];

  };
}
