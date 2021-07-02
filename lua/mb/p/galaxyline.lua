local gl = require("galaxyline")
local gls = gl.section
local c = require("mb.colors")


gl.short_line_list = {" "} -- keeping this table { } as empty will show inactive statuslines


local mode_map = {
    n		= c.blue,
    i		=  c.blue6,
    c		=  c.orange,
    v		=  c.blue5,
    R		=  c.blue,
    t		=  c.purple,

    no		=  c.red,
    ic		=  c.green,
    cv		=  c.orange,
    ce		=  c.orange,
    V		=  c.blue,
    [""]  =  c.aqua,
    ['r?']  =  c.blue,
    Rv		=  c.blue,
    r		=  c.blue,
    rm		=  c.blue,
    s		=  c.yellow,
    S		=  c.yellow,
    ['']  =  c.yellow,
    ['!']	=  c.red,
}

----------------------------=== Funcs ===--------------------------

local function mode_hl() return mode_map[vim.fn.mode()] or c.fg end

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
            highlight2('GalaxyViMode', mode_hl(), c.bg, 'bold')
            highlight1('GalaxyViModeInv', mode_hl(), 'bold')
            return string.format('  %-2s ', vim.fn.mode())
        end,
    }
}

gls.left[3] = {
    LeftBubbleOpen= {
        provider = function()
            highlight2('SecondGalaxyViMode', mode_hl(), c.fg, 'bold')
        end,
        separator = "",
        separator_highlight = 'SecondGalaxyViMode'
    }
}


gls.left[4] = {
	FileIcon = {
       provider = "FileIcon",
       separator = "",
       separator_highlight = {c.fg, c.fg},
       highlight = {c.bg, c.fg}
   }

}

gls.left[5] = {
    FileName = {
        provider = {"FileName", "FileSize"},
        condition = buffer_not_empty,
        highlight = {c.bg, c.fg}
    }
}

gls.left[6] = {
    teech = {
        provider = function()
            return " "
        end,
        separator = "",
        highlight = {c.fg, c.bg}
    }
}


gls.left[7] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {c.red, c.bg}
    }
}

gls.left[8] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {c.green, c.bg}
    }
}

gls.left[9] = {
    DiagnosticInfo = {
        provider = "DiagnosticInfo",
        icon = "  ",
        highlight = {c.blue, c.bg}
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
        highlight = {c.diff_green, c.bg}
    }
}

gls.right[2] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {c.diff_green, c.bg},
    }
}

gls.right[3] = {
    WhiteSpace= {
        provider = function() return " " end,
        separator = "",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {c.bg, c.bg},
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
        highlight = {c.green, c.bg}
    }
}

gls.right[5] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = " ~",
        highlight = {c.orange, c.bg}
    }
}

gls.right[6] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = " -",
        highlight = {c.red, c.bg}
    }
}
gls.right[7] = {
    right_LeftRounded = {
		separator = " ", -- separate from git branch
        provider = function()
            return ""
        end,
        highlight = {c.bg, c.bg}
    }
}


gls.right[8] = {
    PerCent = {
        provider = "LinePercent",
        separator = " ",
        separator_highlight = {c.fg, c.bg},
        highlight = {c.fg, c.bg}
    }
}

gls.right[9] = {
    rightRounded = {
        provider = function()
            return ""
        end,
        highlight = {c.bg, c.bg}
    }
}

