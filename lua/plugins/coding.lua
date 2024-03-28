return {

  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdLineEnter" },
    dependencies = {
      "hrsh7th/cmp-calc", --Works
      "hrsh7th/cmp-cmdline", --Cmdline Completion
      "hrsh7th/cmp-emoji", --Cmdline Completion
      "onsails/lspkind.nvim",
    },

    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      opts.snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      }
      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
      opts.formatting = {
        fields = { "abbr", "menu", "kind" }, -- these fiels decide the members of cmp-pmenu; see help cmp-config.formatting.fields
        --  fields = { 'abbr', 'menu', 'kind'}, -- is a working sequence of fields for jdtls and lua_ls
        format = lspkind.cmp_format({
          mode = "symbol_text", -- show only symbol annotations
          maxwidth = 15, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          ---@diagnostic disable-next-line: unused-local
          before = function(entry, vim_item)
            local maxwidth_cmp = 15
            local cmp_label = vim_item.menu
            local truncated_cmp_label = vim.fn.strcharpart(cmp_label, 0, maxwidth_cmp)
            if truncated_cmp_label ~= cmp_label then
              vim_item.menu = truncated_cmp_label .. "..."
            end
            if vim_item.menu == "v:null..." then
              vim_item.menu = " "
            end
            return vim_item
          end,
        }),
      }
      opts.sources = vim.tbl_extend("force", opts.sources, {
        { name = "emoji" },
      })
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" }, -- Good
          { name = "path" }, -- Good
        },
      })
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }, -- Good
          { name = "path" }, -- Good
        },
      })
    end,
  },
}
