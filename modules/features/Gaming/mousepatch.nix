{ self, inputs, ... }: {
  

  flake.nixosModules.mousePatch = { lib, ... }: {
    
    boot.kernelParams = [
      "usbcore.autosuspend=-1"
    ]

    services.xserver.libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
      };
    };  
  };
}
