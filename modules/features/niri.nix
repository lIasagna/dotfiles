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
        
        prefer-no-csd = {};

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
	  gaps = 12;
	  always-center-single-column = {};
	  empty-workspace-above-first = {};
	  focus-ring.off = {};
	  preset-column-widths = [
	    { proportion = 0.33333; }
	    { proportion = 0.5; }
	    { proportion = 0.66667; }
	    { proportion = 1.0; }
	  ];
	  preset-window-heights = [
	    { proportion = 0.33333; }
	    { proportion = 0.5; }
	    { proportion = 0.66667; }
	    { proportion = 1.0; }
	  ];  
	};

	window-rules = [
	  {
	    geometry-corner-radius = 12;
	    clip-to-geometry = true;
	  }
	];


        binds = {
	  "Mod+Return".spawn-sh = "noctalia msg panel-toggle launcher";
          "Mod+Q".spawn-sh = lib.getExe pkgs.ghostty;
          "Mod+C".close-window = _:{};

          "Mod+J".focus-workspace-down = _:{};
	  "Mod+K".focus-workspace-up = _:{};
	  "Mod+H".focus-column-left = _:{};
	  "Mod+L".focus-column-right = _:{};

	  "Mod+Shift+F".fullscreen-window = _:{};

          "Mod+Shift+J".move-column-to-workspace-down = _:{};
	  "Mod+Shift+K".move-column-to-workspace-up = _:{};
	  "Mod+Shift+H".move-column-left = _:{};
	  "Mod+Shift+L".move-column-right = _:{};

	  "Mod+R".switch-preset-column-width = _:{};
	  "Mod+Ctrl+R".switch-preset-window-height = _:{};

	  "Mod+Shift+S".spawn-sh = "grim -g \"$(slurp)\" - | wl-copy";
        };
      };
    };
  };  
}
