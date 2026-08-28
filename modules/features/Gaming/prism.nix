{ self, inputs, ... }: {

  flake.nixosModules.prismlauncher = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      (prismlauncher.override {
        jdks = [
	  temurin-bin-8
	  temurin-bin-17
	  temurin-bin-21
	];
      })
    ]; 
  };   	
}
