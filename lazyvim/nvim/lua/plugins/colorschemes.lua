-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
--if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- Configure LazyVim to load a specific colorscheme
  {
  "folke/tokyonight.nvim",
    opts = {
      transparent = true,
        styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
    {
      "navarasu/onedark.nvim",
      opts = {
        style = "warm",
        transparent = true,
          styles = {
            sidebars = "transparent",
            floats = "transparent",
          },
      },
    },
    {
      "EdenEast/nightfox.nvim",
      opts = {
        transparent = true,
      },
    }
}
