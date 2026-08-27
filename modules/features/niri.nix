{ self, inputs, ... }: {
  
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.nihonNiri;
    };
  };
  
  perSystem =  { pkgs, lib, self', ... }: {

    packages.nihonNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
	  "noctalia"
	];

        input.keyboard = {
          xkb.layout = "us,jp";
        };

        layout.gaps = 5;

        binds = {
	  "Mod+S".spawn-sh = "noctalia msg panel-toggle launcher";
          "Mod+Return".spawn-sh = lib.getExe pkgs.ghostty;
          "Mod+Q".close-window = _:{};
        };
      };
    };
  };  
}
