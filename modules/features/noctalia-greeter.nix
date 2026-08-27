{ self, inputs, ... }: {
   
  flake.nixosModules.noctalia-greeter = {
    imports = [
      inputs.noctalia-greeter.nixosModules.default
    ];

    programs.noctalia-greeter = {
      enable = true;
      settings = {
        session.default = "niri"
	keyboard.layout = "us"
      };
    };
  };  
}
