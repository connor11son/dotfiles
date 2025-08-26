return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        styles = {
          comments = {}, -- Disable italics in comments (empty table = no italic)
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
          telescope = {
            enabled = true,
          },
          which_key = true,
        },
      }
      -- Load the colorscheme here.
      -- Like many other themes, this one has different flavours, and you could load
      -- any other, such as 'catppuccin-latte', 'catppuccin-frappe', 'catppuccin-macchiato', or 'catppuccin-mocha'.
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
