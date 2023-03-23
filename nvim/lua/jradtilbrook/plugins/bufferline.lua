return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
  opts = {
    options = {
      custom_areas = {
        left = function()
          return {
            { text = '    ', fg = '#8fff6d' },
          }
        end,
      },
    },
  },
}
