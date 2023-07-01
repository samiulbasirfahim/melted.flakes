{...}: {
  programs.nixvim.plugins.nvim-tree = {
    enable = true;
  };
  maps.normal = {
    "<leader>n" = "<cmd>NvimTreeToggle<CR>";
  };
}
