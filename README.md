![banner-light](./assets/banner-light.svg#gh-light-mode-only)
![banner-dark](./assets/banner-dark.svg#gh-dark-mode-only)

# Bluloco.nvim

> [!NOTE]
> This is a fork of the original [Bluloco for neovim](https://github.com/uloco/bluloco.nvim)
> by the awesome [uloco](https://github.com/uloco).
>
> All hard work was done by him,
> I just removed the lush dependency and the terminal themes.

A fancy and sophisticated designer neovim theme.
It features a much more comprehensive usage of syntax scopes and color
consistency, with due regards to aesthetics, contrast and readability.
There is a light and dark variant.
Most popular plugins are also supported, see [Plugins](#plugins)

This theme also works very good with blue light filters like Apple's *Nightshift Mode* or *f.lux*.

This is a port of the popular Visual Studio Code Themes
[Bluloco Light](https://github.com/uloco/theme-bluloco-light) and
[Bluloco Dark](https://github.com/uloco/theme-bluloco-dark)

### Screenshots

See the [wiki screenshots section](https://github.com/mistweaverco/bluloco.nvim/wiki/Screenshots) for a lot of 😅.

## Features

- Exhaustive plugin support
- Written in lua

## Plugins

Currently supported (aka. tested) plugins:

- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter")
- [hlargs](https://github.com/m-demare/hlargs.nvim)
- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [nvim-cursorword](https://github.com/xiyaowong/nvim-cursorword)
- [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)
- [lualine.nvim](https://github.com/hoob3rt/lualine.nvim)
- [barbar.nvim](https://github.com/romgrk/barbar.nvim)
- [nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [neogit](https://github.com/TimUntersberger/neogit)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [vim-which-key](https://github.com/liuchengxu/vim-which-key)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim)
- [lsp-config](https://github.com/neovim/lsp-config)
- [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)

## Install

Install Bluloco with your [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  'mistweaverco/bluloco.nvim',
  config = function()
    require('bluloco').setup({
      theme = 'dark', -- 'dark' or 'light'
      terminal = true, -- 'true' or 'false', set the theme variant for terminal windows
      disable_cache = false, -- if you want to disable the caching feature
      dev = false, -- set to true to disable cache entirely and enable hot reloading of the theme
    })
  end,
  lazy = false,
  priority = 1000,
},
```

## Usage

```lua
vim.cmd('colorscheme bluloco')
```

### Caching

Because the compiled palette is quite large, the theme is cached by default.
If you update the theme or modify it in any way, you can delete the cache by running:

```lua
require('bluloco').clear_cache()
```

#### Lualine

Make sure your lualine settings are set to auto:

```lua
require('lualine').setup {
  options = {
    theme = 'auto'
  }
}
```

## Performance comparison

Because the original theme uses lush,
it is slower than the lua version, with caching enabled.

The performance is negligible, but I'm quite satified with the results,
because caching got me headaches 🤯.

| Variant                              | Total time |
| ------------------------------------ | ---------- |
| mistweaverco/bluloco.nvim (uncached) |     1.20ms |
| mistweaverco/bluloco.nvim (cached)   |     0.68ms |
| uloco/bluloco.nvim                   |     3.62ms |

