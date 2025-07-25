return {

  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<c-h>", desc = "move left" },
      { "<c-j>", desc = "move down" },
      { "<c-k>", desc = "move up" },
      { "<c-l>", desc = "move right" },
    },
  },

  {
    "glacambre/firenvim", -- Firenvim for browser integration
    lazy = not vim.g.started_by_firenvim,
    build = ":call firenvim#install(0)",
    dependencies = {
      "Seghen/blink.cmp",
      opts = {
        completion = {
          menu = {
            draw = {
              columns = { { "label", "label_description", gap = 5 }, { "kind" } }, -- disables kind_icon
            },
          },
        },
      },
    },
    config = function()
      vim.g.firenvim_config = {
        globalSettings = {
          alt = "all",
          cmdlineTimeout = 2001,
          ignoreKeys = {
            all = { "<C-->" },
            -- stylua: ignore
            normal = { "<C-1>", "<C-2>", "<C-3>", "<C-4>", "<C-5>", "<C-6>", "<C-7>", "<C-Tab>", "<F11>", "<F5>", },
          },
        },
        localSettings = {
          [".*"] = {
            cmdline = "firenvim",
            content = "text",
            priority = 0,
            selector = "textarea",
            takeover = "never", -- `takeover` can be set to `always`, `empty`, `never`, `nonempty` or `once`.
          },
          ["leetcode.com"] = {
            takeover = "always",
          },
          ["google.*"] = {
            takeover = "never",
          },
        },
      }
      -- AutoWrite Function
      local function autowrite_buf_content()
        vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
          callback = function()
            if vim.g.timer_started == true then
              return
            end
            vim.g.timer_started = true
            vim.fn.timer_start(10000, function()
              vim.g.timer_started = false
              vim.cmd("write")
            end)
          end,
        })
        print("AutoWrite buff content started...")
        -- code
      end

      vim.api.nvim_create_autocmd({ "BufReadPre" }, {
        callback = function()
          vim.opt.laststatus = 1
          vim.opt.shortmess = "FW"
        end,
      })

      --Keymap for Autowrite_buf_content
      vim.keymap.set("n", "<leader>aw", autowrite_buf_content, { desc = "firenvim AutoWrite to spawned buffer" })
      vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "firenvim write" })
      vim.keymap.set("n", "<esc><esc>", "<cmd>qall!<CR>", { desc = "firenvim quit all" })
    end,
  },

  {
    "michaelb/sniprun",
    enabled = not Termux,
    branch = "master",

    build = "sh install.sh 1",
    -- do 'sh install.sh 1' if you want to force compile locally
    -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

    keys = {
      { "<leader>su", mode = { "n", "v" }, "<Plug>SnipRun", desc = "SnipRun" },
      { "<leader>so", "<Plug>SnipRunOperator", desc = "SnipRunOperater" },
    },

    opts = {
      live_mode_toggle = "enable", -- unsafe
      binary_path = vim.fn.stdpath("data") .. "/lazy/sniprun/target/release/sniprun",
    },
  },

  {
    "NotAShelf/direnv.nvim",
    opts = { autoload_direnv = true, statusline = { enabled = true } },
  },
}
