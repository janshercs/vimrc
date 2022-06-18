local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

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
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	-- Autocomplete
	-- use 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	use {'neoclide/coc.nvim', branch = 'release'}
	use 'SirVer/ultisnips'
	-- Go
	use 'fatih/vim-go'
	-- Python
	use 'vim-scripts/indentpython.vim'
	use 'nvie/vim-flake8'
	-- Git
	use 'tpope/vim-fugitive'
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
	require('packer').sync()
	end
end)
