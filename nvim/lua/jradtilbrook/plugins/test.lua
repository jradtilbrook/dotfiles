return {
  'vim-test/vim-test',
  keys = {
    { '<leader>tn', '<cmd>TestNearest<CR>', desc = '[T]est [N]earest' },
    { '<leader>tf', '<cmd>TestFile<CR>', desc = '[T]est [F]ile' },
    { '<leader>ts', '<cmd>TestSuite<CR>', desc = '[T]est [S]uite' },
    { '<leader>tl', '<cmd>TestLast<CR>', desc = '[T]est [L]ast' },
    { '<leader>tv', '<cmd>TestVisit<CR>', desc = '[T]est [V]isit' },
  },
  config = function()
  end
}
