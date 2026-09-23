{ self, inputs, ... }: {
  
  flake.nixosModules.firewall = {
    networking.firewall = {
      enable = true;
      trustedInterfaces = [ "p2p-w1+" ];
      allowedTCPPorts = [ 8000 7236 7250 ];
      allowedUDPPorts = [ 7236 5353 ];
    };  
  };
}
