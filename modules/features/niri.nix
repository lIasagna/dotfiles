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
      v2-settings = true;
      settings = {
        spawn-at-startup = [
	  "noctalia"
	];

	xwayland-satellite.path =
	  lib.getExe pkgs.xwayland-satellite;

        input = {
	  keyboard = {
            xkb.layout = "us,jp";
	    repeat-delay = 600;
	    repeat-rate = 25;
	  };  
	  mouse = {
	    accel-profile = "flat";
	  };
	  focus-follows-mouse = _:{
	    props = {
	      max-scroll-amount = "10%";
	    };  
	  };  
	};

	outputs = {
	  "DP-1" = {
	    mode = "2560x1440@199.992";
	    focus-at-startup = {};
	    scale = 1;
	    transform = "normal";
	    variable-refresh-rate = {};
	    backdrop-color = "#271926";
	    hot-corners = {
	      top-left = {};
	      bottom-left = {};
	    };
	    position = _: {
	      props = {
	        x = 0;
	        y = 0;
              };		
	    };
	  };  

	  "DP-3" = {
	    mode = "2560x1440@199.992";	
	    scale = 1;
	    transform = "normal";
	    variable-refresh-rate = {};
	    backdrop-color = "#271926";
	    hot-corners = {
	      top-right = {};
	      bottom-right = {};
	    };
	    position = _:{
	      props = {
	        x = 2560;
	        y = 0;
	      };	
	    };
	  };
	};  

        layout = {
	  gaps = 5;
	};  

        binds = {
	  "Mod+Return".spawn-sh = "noctalia msg panel-toggle launcher";
          "Mod+Q".spawn-sh = lib.getExe pkgs.ghostty;
          "Mod+C".close-window = _:{};

          "Mod+WheelScrollDown".focus-workspace-down = _:{};

	  "Mod+WheelScrollUp".focus-workspace-up = _:{};

	  "Mod+Shift+S".spawn-sh = "grim -g \"$(slurp)\" - | wl-copy";
        };
      };
    };
  };  
}
