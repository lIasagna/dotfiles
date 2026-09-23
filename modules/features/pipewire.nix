{ self, inputs, ... }: {
  flake.nixosModules.pipewire = {
    services = {
      avahi = {
        enable = true;
        nssmdns4 = true;
      };
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        wireplumber.enable = true;
      };
      pulseaudio.enable = false;
    };
  };
}
