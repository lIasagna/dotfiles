{ self, inputs, ...}: {

  flake.nixosModules.wmenu = { pkgs, ... }: {

    environment.systemPackackages = with pkgs; [
      wmenu
    ];
  };
}
