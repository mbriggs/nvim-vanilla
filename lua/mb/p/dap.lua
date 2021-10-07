local dap = require'dap'
-- local ui = require'dapui'
local k = vim.keymap
-- local g = vim.g

k.nnoremap{ '<c-j>', function() dap.step_over() end }
k.nnoremap{ '<c-k>', function() dap.step_into() end }
k.nnoremap{ '<c-l>', function() dap.step_out() end }
-- ui

-- k.nnoremap{ '<leader>du', function() ui.toggle() end }

-- g.dap_virtual_text = true
dap.set_log_level("DEBUG")

dap.adapters.go = function(callback, config)
    local handle
    local pid_or_err
    local port = 38697
    --[[ handle, pid_or_err =
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
      100) ]]


    callback({type = "server", host = "127.0.0.1", port = port})
end
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "./${relativeFileDirname}"
  },
  {
    type = "go",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  },
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

-- ui.setup()
