local dap = require'dap'
local ui = require'dapui'
local k = vim.keymap
local g = vim.g

k.nnoremap{ '<leader>db', function() dap.toggle_breakpoint() end }
k.nnoremap{ '<leader>dc', function() dap.continue() end }
k.nnoremap{ '<leader>dr', function() dap.repl.open() end }
k.nnoremap{ '<leader>7', function() dap.step_over() end }
k.nnoremap{ '<leader>8', function() dap.step_into() end }
k.nnoremap{ '<leader>9', function() dap.step_out() end }

-- ui

k.nnoremap{ '<leader>du', function() ui.toggle() end }

g.dap_virtual_text = true

dap.adapters.go = function(callback, config)
  local handle
  local pid_or_err
  local port = 38697
  handle, pid_or_err =
    vim.loop.spawn(
    "dlv",
    {
      args = {"dap", "-l", "127.0.0.1:" .. port},
      detached = true
    },
    function(code)
      handle:close()
      print("Delve exited with exit code: " .. code)
    end
  )
  -- Wait 100ms for delve to start
  vim.defer_fn(
    function()
      --dap.repl.open()
      callback({type = "server", host = "127.0.0.1", port = port})
    end,
    100)


  --callback({type = "server", host = "127.0.0.1", port = port})
end

dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}"
  }
}


-- ruby

dap.adapters.ruby = {
  type = 'executable';
  command = 'bundle';
  args = {'exec', 'readapt', 'stdio'};
}

dap.configurations.ruby = {
  {
    type = 'ruby';
    request = 'launch';
    name = 'Rails';
    program = 'bundle';
    programArgs = {'exec', 'rails', 's'};
    useBundler = true;
  },
}

ui.setup()
