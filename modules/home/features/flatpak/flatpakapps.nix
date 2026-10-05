{ self, inputs, ... }: {

  flake.homeModules.flatpakapps = { lib, ... }: {

    services.flatpak.remotes = lib.mkOptionDefault [{
      name = "flathub-beta";
      location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }];
    
    services.flatpak.update.auto.enable = false;
    services.flatpak.uninstallUnmanaged = false;

    services.flatpak.packages = [ 
      { appId = "org.vinegarhq.Sober"; source = "flathub"; }
    ];
  };
}
