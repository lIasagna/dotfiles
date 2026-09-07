{ self, inputs, ... }: {
  
  flake.nixosModules.environment = {
    environment.sessionVariables = {
      GTK_IM_MODULE = "fcitx5";
      QT_IM_MODULE = "fcitx5";
      XMODIFIERS = "@im=fcitx5";
    };
  };      
}
