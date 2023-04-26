local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- theme / UI
  use 'folke/tokyonight.nvim' 
  use 'nvim-lualine/lualine.nvim' 

  use 'tpope/vim-surround' 
  use 'tpope/vim-commentary' 
  use 'tpope/vim-fugitive' 
  use 'tpope/vim-sensible' 

  use 'junegunn/vim-easy-align' 

  -- Language support
  use 'vim-perl/vim-perl'
  -- use 'fatih/vim-go'
  use 'ray-x/go.nvim'
  use 'rodjek/vim-puppet'
  use 'hashivim/vim-terraform'
  use 'dag/vim-fish'

  use 'ray-x/guihua.lua'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  use 'tpope/vim-repeat'
  use 'ggandor/leap.nvim'

  use 'Shougo/deoplete.nvim'
  use 'majutsushi/tagbar'

  use 'akinsho/toggleterm.nvim'

  use 'neovim/nvim-lspconfig'
  -- use 'dense-analysis/ale'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use 'vladdoster/remember.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
