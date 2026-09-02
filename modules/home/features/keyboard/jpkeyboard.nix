{ self, inputsm ... }: {
  
  flake.homeModules.jpkeyboard = { pkgs, ... }: {
    i18m.inputMethod = {
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
      ];
    };
  };
}
