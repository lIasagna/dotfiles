{ self, inputs, ... }: {
  
  flake.nixosModules.firewall = {
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 8000 ];
    };  
  };
}
