{ self, inputs, ... }: {

  flake.homeModules.bash = {
    programs.bash = {
      enable = true;
      shellAliases = {
        rebuildKyoto = "sudo nixos-rebuild switch --flake .#kyoto";
	btw = "just another sanity check";
      };
    };
  }; 
}
