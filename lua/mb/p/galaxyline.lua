local gl = require("galaxyline")
local gls = gl.section
local neon = require("mb.colors")


gl.short_line_list = {" "} -- keeping this table { } as empty will show inactive statuslines


local mode_map = {
    n		= neon.diff_green,
    i		=  neon.purple,
    c		=  neon.orange,
    v		=  neon.light_blue,
    R		=  neon.light_blue,
    t		=  neon.violet,

    no		=  neon.red,
    ic		=  neon.green,
    cv		=  neon.orange,
    ce		=  neon.orange,
    V		=  neon.light_blue,
    [""]  =  neon.dark_cyan,
    ['r?']  =  neon.light_blue,
    Rv		=  neon.light_blue,
    r		=  neon.light_blue,
    rm		=  neon.light_blue,
    s		=  neon.yellow,
    S		=  neon.yellow,
    ['']  =  neon.yellow,
    ['!']	=  neon.red,
}

----------------------------=== Funcs ===--------------------------

local function mode_hl() return mode_map[vim.fn.mode()] or neon.main end

local function highlight1(group, fg, gui)
    local cmd = string.format('highlight %s guifg=%s', group, fg)
    if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
    vim.cmd(cmd)
end

local function highlight2(group, bg, fg, gui)
    local cmd = string.format('highlight %s guibg=%s guifg=%s', group, bg, fg)
    if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
    vim.cmd(cmd)
end


----------------------------=== Components ===--------------------------

----------------------------=== Left ===--------------------------


gls.left[1] = {
    leftRounded = {
        provider = function()
            return ""
        end,
        highlight = 'GalaxyViModeInv'
    }
}

gls.left[2] = {
    ViMode = {
        provider = function()
            highlight2('GalaxyViMode', mode_hl(), neon.bg0, 'bold')
            highlight1('GalaxyViModeInv', mode_hl(), 'bold')
            return string.format('  %-2s ', vim.fn.mode())
        end,
    }
}

gls.left[3] = {
    LeftBubbleOpen= {
        provider = function()
            highlight2('SecondGalaxyViMode', mode_hl(), neon.fg, 'bold')
        end,
        separator = "",
        separator_highlight = 'SecondGalaxyViMode'
    }
}


gls.left[4] = {
	FileIcon = {
       provider = "FileIcon",
       separator = "",
       separator_highlight = {neon.fg, neon.fg},
       highlight = {neon.bg4, neon.fg}
   }

}

gls.left[5] = {
    FileName = {
        provider = {"FileName", "FileSize"},
        condition = buffer_not_empty,
        highlight = {neon.bg4, neon.fg}
    }
}

gls.left[6] = {
    teech = {
        provider = function()
            return " "
        end,
        separator = "",
        highlight = {neon.fg, neon.bg0}
    }
}


gls.left[7] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {neon.red, neon.bg0}
    }
}

gls.left[8] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {neon.green, neon.bg0}
    }
}

gls.left[9] = {
    DiagnosticInfo = {
        provider = "DiagnosticInfo",
        icon = "  ",
        highlight = {neon.blue, neon.bg0}
    }
}




----------------------------=== Middle ===--------------------------
-- gls.mid[1] = {
-- 	ShowLspClient = {
-- 		provider = 'GetLspClient',
-- 		condition = function ()
-- 			local tbl = {['dashboard'] = true,['']=true}

-- 			if tbl[vim.bo.filetype] then
-- 				return false
-- 			end
-- 			return true
-- 		end,
-- 		icon = ' LSP:',
-- 		highlight = {colors.white,colors.bg,'bold'}
-- 	}
-- }

----------------------------=== Right ===--------------------------

gls.right[1] = {
    GitIcon = {
        provider = function()
            return "   "
        end,
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {neon.diff_green, neon.bg0}
    }
}

gls.right[2] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {neon.diff_green, neon.bg0},
    }
}

gls.right[3] = {
    WhiteSpace= {
        provider = function() return " " end,
        separator = "",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {neon.bg0, neon.bg0},
    }
}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

gls.right[4] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "  +",
        highlight = {neon.yellow, neon.bg0}
    }
}

gls.right[5] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = " ~",
        highlight = {neon.orange, neon.bg0}
    }
}

gls.right[6] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = " -",
        highlight = {neon.red, neon.bg0}
    }
}
gls.right[7] = {
    right_LeftRounded = {
		separator = " ", -- separate from git branch
        provider = function()
            return ""
        end,
        highlight = {neon.bg4, neon.bg0}
    }
}


gls.right[8] = {
    PerCent = {
        provider = "LinePercent",
        separator = " ",
        separator_highlight = {neon.fg, neon.bg4},
        highlight = {neon.fg, neon.bg4}
    }
}

gls.right[9] = {
    rightRounded = {
        provider = function()
            return ""
        end,
        highlight = {neon.bg4, neon.bg0}
    }
}

