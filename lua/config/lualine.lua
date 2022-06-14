vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
local git_blame = require('gitblame')

local function clock()
  return os.date("%H:%M")
end

require('lualine').setup {
  options = {
    theme = "nord",
    icons_enabled = 1,
    section_separators = { " ", " " },
    component_separators = { " ", " " },
 --   section_separators = { "", "" },
 --   component_separators = { "", "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
    lualine_x = { { "diagnostics", sources = { "nvim_lsp" } }, "filename" },
    lualine_y = { "filetype" },
    lualine_z = { clock },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

