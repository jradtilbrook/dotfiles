return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      global_status = true,
      options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '·', right = '·' },
      },
    })
  end,
}
