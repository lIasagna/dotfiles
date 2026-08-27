{ self, inputs, ... }:

{
  flake.nixosModules.home-manager = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      inputs.home-manager.flakeModules.home-manager
    ];

    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;
      extraSpecialArgs = {
        inherit inputs;
      };

      users.kageumi = {
        imports = [
	  self.homeModules.bash
	  self.homeModules.noctalia
	  self.homeModules.zen-browser
	];
      };
      
      home.stateVersion = "26.05";
    };
  };
}
