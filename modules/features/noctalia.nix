{ self, inputs, ... }: {
  
  perSystem = { pkgs, ... }: {
    
    packages.nihonNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap;
      inherit pkgs;
      settings = 
        (builtins.fromTOML
	  (builtins.readFile ./noctalia-config.toml)).settings;
  };
}  
        
        
