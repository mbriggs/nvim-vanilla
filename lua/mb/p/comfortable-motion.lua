local k = vim.keymap


k.noremap{ '<ScrollWheelDown>', ':call comfortable_motion#flick(10)<CR>' }
k.noremap{ '<ScrollWheelUp>', ':call comfortable_motion#flick(-10)<CR>' }
