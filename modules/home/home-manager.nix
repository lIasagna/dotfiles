{ self, inputs, ... }:

{
  flake.nixosModules.home-manager = { lib, ... }: {
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
	  self.homeModules.bash
	  self.homeModules.noctalia
	  self.homeModules.zen-browser
	  self.homeModules.musicplayer
	  self.homeModules.jpkeyboard
	  self.homeModules.neovim
	];
	home.sessionVariables = {
          MPD_HOST = lib.mkForce "/run/user/1001/mpd/socket";
	};
	home.stateVersion = "26.05";
      };
    };  
  };
}
