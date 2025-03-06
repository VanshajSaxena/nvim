return {

  {
    "kawre/leetcode.nvim",
    enabled = not Termux, -- disable on termux
    lazy = "leetcode.nvim" ~= vim.fn.argv(0, -1),
    build = ":TSUpdate html",
    dependencies = {
      "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lang = "python3",
      cache = {
        update_interval = 60 * 60 * 24, -- 24 hours
      },
      plugins = {
        non_standalone = true,
      },
      image_support = true,
    },
    keys = {
      { "<leader>Lm", "<cmd>Leet<cr>", desc = "Leet Menu" },
      { "<leader>Ll", "<cmd>Leet list<cr>", desc = "Leet List" },
      { "<leader>Ls", "<cmd>Leet submit<cr>", desc = "Leet Submit" },
      { "<F8>", "<cmd>Leet submit<cr>", desc = "Leet Submit" },
      { "<leader>Lr", "<cmd>Leet run<cr>", desc = "Leet Run" },
      { "<F7>", "<cmd>Leet run<cr>", desc = "Leet Run" },
      { "<leader>LR", "<cmd>Leet reset<cr>", desc = "Leet Reset" },
      { "<leader>LL", "<cmd>Leet last_submit<cr>", desc = "Leet Last Submit" },
      { "<leader>Lo", "<cmd>Leet open<cr>", desc = "Leet Open" },
      { "<leader>Lc", "<cmd>Leet console<cr>", desc = "Leet Console" },
    },
  },

  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    keys = {
      -- stylua: ignore start
      { "<localleader>nj", "<cmd>Neorg journal today<cr>", desc = "[neorg] Journal Today" },
      -- override todo-comments for norg files
      { "<leader>st", function() Snacks.picker.todo_comments({ keywords = {"TOPICS"} }) end, desc = "Topics", ft = "norg" },
      -- stylua: ignore end
      {
        "<localleader>nC",
        -- NOTE: This needs a refactor, maybe the async job can be done
        -- differently with a better API/Approach.
        function()
          local commit_msg = "Save Notes"
          local git_commit_command = "git commit -m '" .. commit_msg .. "'"

          -- Callback for handling the commit command result.
          local function on_commit_exit(_job_id, exit_code, _event_type)
            if exit_code ~= 0 then
              vim.schedule(function()
                vim.notify("Git commit failed. Make sure there are staged changes and you are in a Git repository.")
              end)
              return
            end
            vim.schedule(function()
              vim.notify("Commit Successful")
            end)
            -- Now run the push command asynchronously.
            local function on_push_exit(_push_job_id, push_exit_code, _push_event_type)
              if push_exit_code ~= 0 then
                vim.schedule(function()
                  vim.notify("Git push failed.")
                end)
                return
              end
              vim.schedule(function()
                vim.notify("Push Successful")
              end)
            end
            vim.fn.jobstart("git push", {
              on_exit = on_push_exit,
            })
          end
          vim.fn.jobstart(git_commit_command, {
            on_exit = on_commit_exit,
          })
        end,
        desc = "[neorg] Commit and Save Notes",
        ft = "norg",
      },
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.ui.calendar"] = {},
          ["core.export"] = {},
          ["core.journal"] = {
            config = {
              workspace = "journal",
            },
          },
          ["core.dirman"] = {
            config = {
              default_workspace = "notes",
              use_popup = true,
              workspaces = {
                journal = "~/neorg",
                short_notes = "~/neorg/short_notes",
                notes = "~/neorg/notes",
                DSA = "~/code/DSA",
              },
            },
          },
          -- ["core.completion"] = {
          --   config = {
          --     engine = "nvim-cmp",
          --   },
          -- },
        },
      })
    end,
  },
}
