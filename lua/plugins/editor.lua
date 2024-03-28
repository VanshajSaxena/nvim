return {
  {
    "nvim-telescope/telescope.nvim",

    --[[
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
      config = function()
        require("telescope").setup({
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown({
                initial_mode = "insert",
              }),
            },
          },
        })
        require("telescope").load_extension("ui-select")
      end,
    },
]]

    keys = {
      {
        "<leader>sp",
        "<cmd>Telescope builtin<cr>",
        desc = "telescope builtins",
      },
    },

    opts = {
      defaults = {
        selection_strategy = "follow",
        mappings = {
          n = {
            ["t"] = function(...)
              return require("telescope.actions").file_tab(...)
            end,
            ["s"] = function(...)
              return require("telescope.actions").file_vsplit(...)
            end,
            ["h"] = function(...)
              return require("telescope.actions").file_split(...)
            end,
          },
        },
      },
    },
  },
}
