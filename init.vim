call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'elzr/vim-json'
Plug 'preservim/nerdcommenter'

" neo
Plug 'github/copilot.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mbbill/undotree'

" Colours
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" LSP Support
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'neovim/nvim-lspconfig'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
" LSP
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
call plug#end()

lua require'nvim-treesitter'.setup {}

lua require("ewan")
