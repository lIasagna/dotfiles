{ self, inputs, ...}: {

  flake.nixosModules.wmenu = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      wmenu
    ];
  };
}
