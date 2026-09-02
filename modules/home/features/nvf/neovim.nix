{ self, inputs, ... }: {
  
  flake.homeModules.neovim = { pkgs, ... }: {
    
    imports = [
      self.homeModules.nvf
    ];

    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
