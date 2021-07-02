local ultest = require'ultest'
local cmd = vim.cmd
local g = vim.g
local k = vim.keymap

g.ultest_use_pty = true

k.nnoremap{ '<leader>tt', ':UltestNearest<CR>' }
k.nnoremap{ '<leader>tf', ':Ultest<CR>' }
k.nnoremap{ '<leader>td', ':UltestDebugNearest<CR>' }
k.nnoremap{ '<leader>to', ':UltestOutput<CR>' }
k.nnoremap{ '<leader>tx', ':UltestSummary<CR>' }
k.nnoremap{ '<leader>ta', ':TestSuite<CR>' }
k.nnoremap{ '<leader>tl', ':TestLast<CR>' }
k.nnoremap{ '<leader>t.', ':TestVisit<CR>' }


ultest.setup({
  builders = {
    ['go#gotest'] = function(cmd)
      local args = {"dap", "-l", "127.0.0.1:38697"}
      for i = 3, #cmd - 1, 1 do
        local arg = cmd[i]
        if vim.startswith(arg, "-") then
          -- Delve requires test flags be prefix with 'test.'
          arg = "-test." .. string.sub(arg, 2)
        end
        args[#args + 1] = arg
      end
      return {
        dap = {
          type = "go",
          name = "Debug",
          request = "launch",
          program = "${file}",
          args = args
        },
        parse_result = function(lines)
          return lines[#lines] == "FAIL" and 1 or 0
        end
      }
    end
  }
})
