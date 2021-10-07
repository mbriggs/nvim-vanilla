local ultest = require'ultest'
local g = vim.g

g.ultest_use_pty = true


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
