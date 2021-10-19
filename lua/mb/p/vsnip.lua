local k = vim.keymap

-- expand
k.imap{ '<c-j>', [[vsnip#expandable()  ? '<Plug>(vsnip-expand)']], expr=true }
k.smap{ '<c-j>', [[vsnip#expandable()  ? '<Plug>(vsnip-expand)']], expr=true }

-- " Expand or jump
k.imap{ '<c-l>', [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)']], expr=true }
k.smap{ '<c-l>', [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)']], expr=true }

-- " Jump forward or backward
k.imap{ '<Tab>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)']], expr=true }
k.smap{ '<Tab>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)']], expr=true }
k.imap{ '<S-Tab>', [[vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)']], expr=true }
k.smap{ '<S-Tab>', [[vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)']], expr=true }

-- " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- " See https://github.com/hrsh7th/vim-vsnip/pull/50
k.nmap{ 's', [[<Plug>(vsnip-select-text)]] }
k.xmap{ 's', [[<Plug>(vsnip-select-text)]] }
k.nmap{ 'S', [[<Plug>(vsnip-cut-text)]] }
k.xmap{ 'S', [[<Plug>(vsnip-cut-text)]] }
