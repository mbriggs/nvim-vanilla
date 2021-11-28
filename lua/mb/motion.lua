local P = { installed = false }


local function cm_config()
  local k = vim.keymap
  k.noremap{ '<ScrollWheelDown>', ':call comfortable_motion#flick(10)<CR>' }
  k.noremap{ '<ScrollWheelUp>', ':call comfortable_motion#flick(-10)<CR>' }
end

function P.install(use)
  if P.installed then
    return
  end

  use {
    'kana/vim-niceblock',
    { 'rhysd/vim-textobj-anyblock', requires = 'kana/vim-textobj-user' },
    { 'chaoren/vim-wordmotion', setup = [[vim.g.wordmotion_prefix = '<space>']] },
    { "yuttie/comfortable-motion.vim", config = cm_config },
  }

  P.installed = true
end

return P
