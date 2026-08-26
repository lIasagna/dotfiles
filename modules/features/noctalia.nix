{ self, inputs, ... }: {
  
  perSystem = { pkgs, ... }:
    
    packages.nihonNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap;
      inherit pkgs;
      settings = {
       
