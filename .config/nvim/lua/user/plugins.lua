local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install plugins here --
return packer.startup(function(use)

    -- Misc
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

    -- improve startup
    use 'lewis6991/impatient.nvim'

    -- colors
    -- use 'Mofiqul/dracula.nvim'
    use 'folke/tokyonight.nvim'

    -- cmp plugins
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "hrsh7th/cmp-nvim-lsp" --LSP completion
    use "hrsh7th/cmp-nvim-lua" --LSP completion
    use "hrsh7th/nvim-cmp" -- The completion plugin

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "saadparwaiz1/cmp_luasnip" -- snippet completions

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    -- use 'nvim-telescope/telescope-media-files.nvim'

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        -- run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        run = ":TSUpdate"
    }

    -- Comments-
    use "numToStr/Comment.nvim" -- Easily comment stuff
    use 'JoosepAlviste/nvim-ts-context-commentstring' -- for Comments

    -- Explorer
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- Modeline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Motion
    use 'ggandor/leap.nvim'
    -- use 'justinmk/vim-sneak'
    -- vim.g["sneak#label"] = true

    -- Auto close brackets
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "windwp/nvim-ts-autotag" -- Autotag for <...>

    -- Show indent-lines
    --use "lukas-reineke/indent-blankline.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
