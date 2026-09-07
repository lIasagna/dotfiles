{ self, inputs, ... }: {

  flake.nixosModules.portals = { pkgs, ... }: {
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
      ]; 
    };
  };              
}
