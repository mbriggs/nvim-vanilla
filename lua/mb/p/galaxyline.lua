local gl = require("galaxyline")
local gls = gl.section
local neon = require("neon.colors")


gl.short_line_list = {" "} -- keeping this table { } as empty will show inactive statuslines

local colors = {
    main = "#ff87ff",
    bg_alt = "#0B0C15",
    lightbg = "#21252B",
    commented = "#5c6370",
	grey = "#3c4048",
	line_bg = "#282c34",
	creamydark = "#282c34",
    purple = "#252930",
    cyan = "#00FFFF",
    nord = "#81A1C1",
	lightblue = "#81a1c1",
    darkblue = "#61afef",
    blue = "#61afef",
	limegreen = "#bbe67e",
    green = "#7ed491",
    fg_green = "#65a380",
	creamygreen = "#a3be8c",
    yellow = "#A3BE8C",
	creamyorange = "#ff8800",
    orange = "#FF8800",
    bg = "#000B0C15",
    fg = "#D8DEE9",
    magenta = "#c678dd",
    red = "#df8890",
	crimsonRed = "#990000",
    greenYel = "#EBCB8B",
    white = "#d8dee9",
	brown = "91684a"
}

local mode_map = {
    n		= {" n ", neon.red},
    i		= {" i ", neon.green},
    c		= {" c ", neon.orange},
    v		= {" ", neon.light_blue},
    R		= {" ", neon.light_blue},
	t		= {"  ", neon.violet},

	no		= {" ", neon.red},
	ic		= {" ", neon.green},
	cv		= {" ", neon.orange},
	ce		= {" ", neon.orange},
    V		= {" ", neon.light_blue},
    [""]  = {" ", neon.dark_cyan},
	['r?']  = {" ", neon.light_blue},
	Rv		= {" ", neon.light_blue},
	r		= {" ", neon.light_blue},
	rm		= {" ", neon.light_blue},
	s		= {"  S ", colors.yellow},
	S		= {"  S ", colors.yellow},
	['']  = {"  S ", colors.yellow},
	['!']	= {" ! ", colors.red},
}

----------------------------=== Funcs ===--------------------------

local function mode_label() return mode_map[vim.fn.mode()][1] or 'N/A' end
local function mode_hl() return mode_map[vim.fn.mode()][2] or colors.main end

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
    WhiteSpace = {
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

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

gls.right[3] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "  +",
        highlight = {neon.yellow, neon.bg0}
    }
}

gls.right[4] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = " ~",
        highlight = {neon.orange, neon.bg0}
    }
}

gls.right[5] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = " -",
        highlight = {neon.red, neon.bg0}
    }
}
gls.right[6] = {
    right_LeftRounded = {
		separator = "", -- separate from git branch
        provider = function()
            return ""
        end,
        highlight = {neon.bg4, neon.bg0}
    }
}


gls.right[7] = {
    PerCent = {
        provider = "LinePercent",
        separator = " ",
        separator_highlight = {neon.fg, neon.bg4},
        highlight = {neon.fg, neon.bg4}
    }
}

gls.right[8] = {
    rightRounded = {
        provider = function()
            return ""
        end,
        highlight = {neon.bg4, neon.bg0}
    }
}

