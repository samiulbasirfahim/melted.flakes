{...}: {
  programs.nixvim.plugins.nvim-tree = {
    enable = true;
    actions.changeDir.enable = true;
  };
  programs.nixvim.maps.normal = {
    "<leader>n" = "<cmd>NvimTreeToggle<CR>";
    "<leader>e" = "<cmd>NvimTreeFocus<CR>";
  };
}
