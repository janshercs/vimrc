return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- vim appearances
	use 'joshdick/onedark.vim'
	use 'vim-airline/vim-airline'
	-- General IDE
	use 'yssl/QFEnter'
	use 'vim-syntastic/syntastic'
	use 'scrooloose/nerdtree'
	use 'junegunn/fzf.vim'
	use 'junegunn/fzf'
	use 'dominikduda/vim_current_word'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	-- use 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	use {'neoclide/coc.nvim', branch = 'release'}
	-- Go
	use 'fatih/vim-go'
	-- Python
	use 'vim-scripts/indentpython.vim'
	use 'nvie/vim-flake8'
	-- Git
	use 'tpope/vim-fugitive'
end)