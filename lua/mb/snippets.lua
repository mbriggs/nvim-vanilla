local P = { installed = false }

function P.vsnip_config()
  local k = vim.keymap

  -- expand
  k.imap{ '<c-j>', [[vsnip#expandable()  ? '<Plug>(vsnip-expand)' : '<c-j>']], expr=true }
  k.smap{ '<c-j>', [[vsnip#expandable()  ? '<Plug>(vsnip-expand)' : '<c-j>']], expr=true }

  -- " Expand or jump
  k.imap{ '<c-l>', [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<c-l>']], expr=true }
  k.smap{ '<c-l>', [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<c-l>']], expr=true }

  -- " Jump forward or backward
  k.imap{ '<Tab>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>']], expr=true }
  k.smap{ '<Tab>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>']], expr=true }
  k.imap{ '<S-Tab>', [[vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']], expr=true }
  k.smap{ '<S-Tab>', [[vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']], expr=true }
end

function P.install(use)
  if P.installed then
    return
  end

  use { 'hrsh7th/vim-vsnip', config = P.vsnip_config }

  P.installed = true
end

return P
