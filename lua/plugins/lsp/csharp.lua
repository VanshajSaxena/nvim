return {
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    },
  },

  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {
      -- https://github.com/seblyng/roslyn.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
    },
    init = function()
      vim.lsp.config("roslyn", {
        on_attach = function()
          print("Roslyn on_attach ran.")
        end,
        settings = {
          -- https://github.com/dotnet/vscode-csharp/blob/main/test/lsptoolshost/unitTests/configurationMiddleware.test.ts
          ["csharp|inlay_hints"] = {
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            csharp_enable_inlay_hints_for_types = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = false,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = false,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = false,
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = false,
            dotnet_enable_tests_code_lens = true,
          },
          ["csharp|background_analysis"] = {
            dotnet_analyzer_diagnostics_scope = true,
            dotnet_compiler_diagnostics_scope = true,
          },
          ["csharp|completion"] = {
            dotnet_provide_regex_completions = true,
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
          },
          ["csharp|symbol_search"] = {
            dotnet_search_reference_assemblies = true,
          },
          ["csharp|formatting"] = {
            dotnet_organize_imports_on_format = true,
          },
          ["csharp|type_members"] = {
            dotnet_member_insertion_location = true,
            dotnet_property_generation_behavior = true,
          },
          ["csharp|quick_info"] = {
            dotnet_show_remarks_in_quick_info = true,
          },
          ["csharp|highlighting"] = {
            dotnet_highlight_related_regex_components = true,
            dotnet_highlight_related_json_components = true,
          },
          ["navigation"] = {
            dotnet_navigate_to_decompiled_sources = true,
          },
          ["text_editor"] = {
            tab_width = 4,
          },
          ["csharp|code_style.formatting.indentation_and_spacing"] = {
            tab_width = 4,
          },
        },
      })
    end,
  },
}
