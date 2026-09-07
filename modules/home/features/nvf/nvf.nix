{ self, inputs, ... }: {
  
  flake.homeModules.nvf = {
    imports = [
      inputs.nvf.homeManagerModules.default
    ];  
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
	  viAlias = false;
	  vimAlias = true;

          statusline.lualine.enable = true;
	  telescope.enable = true;
	  autocomplete.nvim-cmp.enable = true;

	  languages = {
	    enableTreesitter = true;

	    nix = {
	      enable = true;
	      lsp.enable = true;
	    };  
	    bash.enable = true;
	    lua.enable = true;
	  };  
        };
      };
    };  
  };
}
