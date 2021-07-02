local g = vim.g
local k = vim.keymap

k.nmap { '<leader>vl', ':call vimspector#Launch()<CR>' }
k.nmap { '<leader>vv', ':call vimspector#ToggleBreakpoint()<CR>'}
k.nmap { '<leader>vr', ':VimspectorReset<CR>' }
k.nmap { '<leader>ve', ':VimspectorEval' }
k.nmap { '<leader>vw', ':VimspectorWatch' }
k.nmap { '<leader>vo', ':VimspectorShowOutput' }
k.nmap { '<leader>vi', '<Plug>VimspectorBalloonEval' }
k.xmap { '<leader>vi', '<Plug>VimspectorBalloonEval' }


k.nmap { '<C-h>', '<Plug>VimspectorStepOver' }
k.nmap { '<C-j>', '<Plug>VimspectorStepInto' }
k.nmap { '<C-k>', '<Plug>VimspectorStepOut' }
k.nmap { '<C-l>', '<Plug>VimspectorContinue' }
k.nmap { '<C-;>', '<Plug>VimspectorRunToCursor' }

-- human bindings
--[[ | 'F5'         | '<Plug>VimspectorContinue'                    | When debugging, continue. Otherwise start debugging.      |
----------------------------------------------------------------------------------------------------------------------------
| 'F3'         | '<Plug>VimspectorStop'                        | Stop debugging.                                           |
----------------------------------------------------------------------------------------------------------------------------
| 'F4'         | '<Plug>VimspectorRestart'                     | Restart debugging with the same configuration.            |
----------------------------------------------------------------------------------------------------------------------------
| 'F6'         | '<Plug>VimspectorPause'                       | Pause debuggee.                                           |
----------------------------------------------------------------------------------------------------------------------------
| 'F9'         | '<Plug>VimspectorToggleBreakpoint'            | Toggle line breakpoint on the current line.               |
----------------------------------------------------------------------------------------------------------------------------
| '<leader>F9' | '<Plug>VimspectorToggleConditionalBreakpoint' | Toggle conditional line breakpoint on the current line.   |
----------------------------------------------------------------------------------------------------------------------------
| 'F8'         | '<Plug>VimspectorAddFunctionBreakpoint'       | Add a function breakpoint for the expression under cursor |
----------------------------------------------------------------------------------------------------------------------------
| '<leader>F8' | '<Plug>VimspectorRunToCursor'                 | Run to Cursor                                             |
----------------------------------------------------------------------------------------------------------------------------
| 'F10'        | '<Plug>VimspectorStepOver'                    | Step Over                                                 |
----------------------------------------------------------------------------------------------------------------------------
| 'F11'        | '<Plug>VimspectorStepInto'                    | Step Into                                                 |
----------------------------------------------------------------------------------------------------------------------------
| 'F12'        | '<Plug>VimspectorStepOut'                     | Step out of current function scope                        | ]]
