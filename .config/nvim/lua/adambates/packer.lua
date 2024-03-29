-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  use('folke/tokyonight.nvim')

  use('kyazdani42/nvim-web-devicons')

  use({
      'kyazdani42/nvim-tree.lua',
      requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
  })

  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  use({
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
  })

  use('neovim/nvim-lspconfig')

  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/nvim-cmp')
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')

  use({
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
          require("lsp_lines").setup()
      end,
  })

  use('APZelos/blamer.nvim')

  use({
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup({
              ignore = '^$', -- ignore empty lines
              mappings = false,
          })
      end
  })

end)

