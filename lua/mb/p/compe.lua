local compe = require'compe'
local k = vim.keymap

compe.setup {
  enabled = true;
  autocomplete = false;
  debug = false;
  min_length = 1;
  preselect = 'always';
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = false;
  };
}

k.inoremap{ '<c-space>', 'compe#complete()', expr = true }
