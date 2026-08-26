{ self, inputs, ... }:

{
  flake.nixosModules.home-manager = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;
      extraSpecialArgs = {
        inherit inputs;
      };

      users.kageumi = {
        imports = [
	];
      };
      
      home.stateVersion = "26.05";
    };
  };
}
