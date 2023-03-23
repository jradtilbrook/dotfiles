-- TODO: set up language folding
vim.o.autoread = true
vim.o.autowriteall = true
vim.o.backup = false
vim.o.expandtab = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.laststatus = 3
vim.o.lazyredraw = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.shiftround = true
vim.o.showmode = false
vim.o.sidescroll = 1
vim.o.sidescrolloff = 20
vim.o.signcolumn = 'yes:2'
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.title = true
vim.o.undofile = true
vim.o.wrap = false
vim.opt.completeopt = { 'menu', 'menuone' , 'noselect' , 'preview' }
vim.opt.fillchars:append { eob = ' ' }
vim.opt.listchars:append { tab = '» ', trail = '·' }
vim.opt.matchpairs:append { '<:>' }
