{ self, inputs, ... }: {
  flake.nixosModules.pipewire = {
    services = {
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
