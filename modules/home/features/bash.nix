{ self, inputs, ... }: {

  flake.homeModules.bash = {
    programs.bash = {
      enable - true;
      shellAliases = {
        rebuildKyoto = "sudo nixos-rebuild switch --flake .#kyoto";
      };
    };
  }; 
}
