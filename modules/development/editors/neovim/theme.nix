{
  xdg.configFile."nvimc.lua".text = ''
local M = {}

function M.get_palette()
	vim.cmd([[ source $HOME/.cache/wal/colors-wal.vim ]])
	return {
		background = vim.g.background,
		foreground = vim.g.foreground,
    lighter = "#1a1e23";
		cursorline = "#313244",
		comments = vim.g.color8,
		cursor = vim.g.cursor,
		black = vim.g.color0,
		red = vim.g.color1,
		green = vim.g.color3,
		yellow = vim.g.color3,
		blue = vim.g.color4,
		magenta = vim.g.color5,
		cyan = vim.g.color6,
		white = vim.g.color7,
		brightblack = vim.g.color8,
		brightred = vim.g.color9,
		brightgreen = vim.g.color10,
		brightyellow = vim.g.color11,
		brightblue = vim.g.color12,
		brightmagenta = vim.g.color13,
		brightcyan = vim.g.color14,
		brightwhite = vim.g.color15,
	}
end

return M '';
}
