{ self, inputs ... }: {

  flake.homeModules.flatpak = {

    services.flatpak = {
      enable = true;
      packages = [
        { appId = "org.vinegarhq.Sober"; source = "flathub"; }
      ];
    };

  };
}
