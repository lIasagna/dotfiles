{ self, inputs, ... }: {

  flake.nixosModules.prismlauncher = {
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
