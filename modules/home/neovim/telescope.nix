{...}: {
  programs.nixvim.plugins.telescope = {
    enable = true;
  };
  programs.nixvim.maps.normal = {
    "<Leader>ff" = "<cmd>Telescope find_files<cr>";
    "<leader>fw" = "<cmd>Telescope live_grep<cr>";
    "<leader>fb" = "<cmd>Telescope buffers<cr>";
    "<leader>fk" = "<cmd>Telescope keymaps<cr>";
  };
}
