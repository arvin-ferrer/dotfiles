-- colors/colorscheme.lua

local colors = {
	-- content here will not be touched
	-- PATCH_OPEN
Normal = {fg = "#E0CFED", bg = "None"},
["@punctuation.bracket"] = {link = "Normal"},
["@punctuation.delimiter"] = {link = "Normal"},
["@punctuation.special"] = {link = "Normal"},
Boolean = {fg = "#B657FF"},
Character = {fg = "#B657FF"},
Comment = {fg = "#624E6E", italic = true},
Conditional = {fg = "#8E6EA6"},
["@keyword.conditional"] = {link = "Conditional"},
Constant = {fg = "#B657FF"},
CursorLine = {bg = "#2F173F"},
CursorLineNr = {fg = "#A39EFA"},
Define = {fg = "#8E6EA6"},
DiagnosticError = {fg = "#FF1A00"},
["@comment.error"] = {link = "DiagnosticError"},
DiagnosticFloatingError = {fg = "#FF1A00"},
DiagnosticFloatingHint = {fg = "#9ED8FF"},
DiagnosticFloatingInfo = {fg = "#85EFEF"},
DiagnosticFloatingOk = {fg = "#ABEDB8"},
DiagnosticFloatingWarn = {fg = "#E5E619"},
DiagnosticHint = {fg = "#9ED8FF"},
["@comment.hint"] = {link = "DiagnosticHint"},
DiagnosticInfo = {fg = "#85EFEF"},
["@comment.info"] = {link = "DiagnosticInfo"},
DiagnosticOk = {fg = "#ABEDB8"},
DiagnosticSignError = {fg = "#FF1A00"},
DiagnosticSignHint = {fg = "#9ED8FF"},
DiagnosticSignInfo = {fg = "#85EFEF"},
DiagnosticSignOk = {fg = "#ABEDB8"},
DiagnosticSignWarn = {fg = "#E5E619"},
DiagnosticVirtualTextError = {fg = "#FF1A00"},
DiagnosticVirtualTextHint = {fg = "#9ED8FF"},
DiagnosticVirtualTextInfo = {fg = "#85EFEF"},
DiagnosticVirtualTextOk = {fg = "#ABEDB8"},
DiagnosticVirtualTextWarn = {fg = "#E5E619"},
DiagnosticWarn = {fg = "#E5E619"},
["@comment.warning"] = {link = "DiagnosticWarn"},
EndOfBuffer = {fg = "#FA9EBD"},
Exception = {fg = "#8E6EA6"},
Float = {fg = "#F25AE5"},
Function = {fg = "#F5B2F0"},
Identifier = {fg = "#E0CFED"},
Include = {fg = "#8E6EA6"},
["@keyword.import"] = {link = "Include"},
Keyword = {fg = "#8E6EA6"},
Label = {fg = "#8E6EA6"},
LineNr = {fg = "#F5B2F0"},
LineNrAbove = {fg = "#F5B2F0"},
LineNrBelow = {fg = "#F5B2F0"},
Macro = {fg = "#8E6EA6"},
ModeMsg = {fg = "#F5B2F0"},
NormalFloat = {fg = "#E0CFED", bg = "None"},
Number = {fg = "#F25AE5"},
Operator = {fg = "#B657FF"},
PreCondit = {fg = "#8E6EA6"},
PreProc = {fg = "#8E6EA6"},
Repeat = {fg = "#8E6EA6"},
Search = {fg = "#333333", bg = "#FFE894"},
SignColumn = {bg = "None"},
Special = {},
Statement = {fg = "#8E6EA6"},
StatusLine = {fg = "#FFFFFF", bg = "None"},
StorageClass = {fg = "#8E6EA6"},
String = {fg = "#F5B2F0"},
Structure = {fg = "#8E6EA6"},
Tag = {fg = "#A39EFA"},
TermCursor = {fg = "#FFFFFF"},
Type = {fg = "#A39EFA"},
["@type"] = {link = "Type"},
Typedef = {fg = "#8E6EA6"},
Visual = {fg = "#FFFFCC", bg = "#7E77F8"},
["@boolean"] = {fg = "#B657FF"},
["@character"] = {fg = "#E0CFED"},
["@comment"] = {fg = "#624E6E", italic = true},
["@comment.documentation"] = {fg = "#624E6E", italic = true},
["@comment.todo"] = {fg = "#000000", bg = "#10B77F", bold = true},
["@constant"] = {fg = "#B657FF"},
["@constant.builtin"] = {fg = "#B657FF"},
["@constant.macro"] = {fg = "#B657FF"},
["@float"] = {fg = "#F25AE5"},
["@function"] = {fg = "#F5B2F0"},
["@function.builtin"] = {fg = "#8E69C9"},
["@function.call"] = {fg = "#8E69C9"},
["@function.macro"] = {fg = "#8E6EA6"},
["@keyword"] = {fg = "#8E6EA6"},
["@keyword.coroutine"] = {fg = "#8E6EA6"},
["@keyword.directive"] = {fg = "#624E6E"},
["@keyword.directive.define"] = {link = "@keyword.directive"},
["@keyword.exception"] = {fg = "#624E6E"},
["@keyword.function"] = {fg = "#8E6EA6"},
["@keyword.modifier"] = {fg = "#8E6EA6"},
["@keyword.operator"] = {fg = "#624E6E"},
["@keyword.repeat"] = {fg = "#8E6EA6"},
["@keyword.return"] = {fg = "#8E6EA6"},
["@keyword.type"] = {fg = "#8E6EA6"},
["@number"] = {fg = "#F25AE5"},
["@operator"] = {fg = "#B657FF"},
["@keyword.conditional.ternary"] = {link = "@operator"},
["@string"] = {fg = "#F5B2F0"},
["@type.builtin"] = {fg = "#A39EFA"},
["@type.definition"] = {fg = "#B657FF"},
["@variable"] = {fg = "#E0E0E0"},
["@variable.builtin"] = {fg = "#E0E0E0"},
["@variable.member"] = {fg = "#E0E0E0"},
["@variable.parameter"] = {fg = "#E0E0E0"},
["@variable.parameter.builtin"] = {fg = "#E0E0E0"},
	-- PATCH_CLOSE
	-- content here will not be touched
}

-- colorschemes generally want to do this
vim.cmd("highlight clear")
vim.cmd("set t_Co=256")
vim.cmd("let g:colors_name='lillilac'")
--[[
vim.api.nvim_set_hl(0, "DiagnosticErrorLn", { bg = "#330000" })
vim.api.nvim_set_hl(0, "DiagnosticWarningLn", { bg = "#727212" })
vim.api.nvim_set_hl(0, "DiagnosticInfoLn", { bg = "#00afaf" })
vim.api.nvim_set_hl(0, "DiagnosticHintLn", { bg = "#00af00" })
--]]
-- apply highlight groups
for group, attrs in pairs(colors) do
	vim.api.nvim_set_hl(0, group, attrs)
end
-- FFD700
vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#C76E00" })  -- Gold color for brackets and parentheses
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#C76E00" })  -- Gold color for other delimiters

