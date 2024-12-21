return {

  {
    "seghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          border = "rounded",
          winblend = 0,
          draw = {
            columns = { { "label", "label_description", gap = 5 }, { "kind_icon", "kind" } },
          },
        },
        documentation = {
          window = {
            border = "rounded",
          },
        },
      },
      signature = {
        enabled = true,
        window = {
          border = "rounded",
        },
      },
    },
  },

  {
    "zbirenbaum/copilot.lua",
    cond = not Termux,
    opts = {
      filetypes = {
        java = false,
      },
    },
    keys = {
      { "<leader>uo", "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      prompts = {
        AddComments = {
          prompt = [[

            Add Comments to the give code, explaining at each step, why some decisions were made. Do not explain how the code works,
            rather try to explain the significance of the approach used in the code.

          ]],
          system_prompt = [[

            You are an AI programming assistant.
            The user works in an IDE called Neovim which has a concept for editors with open files, integrated unit test support, an output pane that shows the output of running the code as well as an integrated terminal.
            The user is working on a %s machine. Please respond with system specific commands if applicable.

            Your task is to modify the provided code according to the user's request. Follow these instructions precisely:

            1. Return *ONLY* the complete modified code.

            2. Ensure the returned code is complete and can be directly used as a replacement for the original code.

            3. Preserve the original structure, indentation, and formatting of the code as much as possible.

            4. *DO NOT* omit any parts of the code, even if they are unchanged.

            5. Maintain the *SAME INDENTATION* in the returned code as in the source code

            6. *ONLY* return the new code snippets to be updated, *DO NOT* return the entire file content.

            7. If the response do not fits in a single message, split the response into multiple messages.

            8. Directly above every returned code snippet, add `[file:<file_name>](<file_path>) line:<start_line>-<end_line>`. Example: `[file:copilot.lua](nvim/.config/nvim/lua/config/copilot.lua) line:1-98`. This is markdown link syntax, so make sure to follow it.

            9. When fixing code pay close attention to diagnostics as well. When fixing diagnostics, include diagnostic content in your response.

            Remember that Your response SHOULD CONTAIN ONLY THE MODIFIED CODE to be used as DIRECT REPLACEMENT to the original file, and SHOULD NOT INCLUDE ANY LINE NUMBERS.

          ]],
          description = "Add Commnet to the code, to explain why some decisions were made.",
        },
      },
    },
  },
}
