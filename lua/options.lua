local opt = vim.opt
local hl = vim.api.nvim_set_hl

opt.tabstop = 4
opt.number = true
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.updatetime = 50
opt.hlsearch = true
opt.tw = 100
opt.spelllang = "en_gb"
opt.inccommand = "split"
opt.splitbelow = true
opt.splitright = true
opt.clipboard = "unnamedplus"
opt.formatoptions:remove("o")
opt.shada = { "'10", "<0", "s10", "h" }

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

hl(0, "Normal", { bg = "none" })
hl(0, "NormalFloat", { bg = "none" })
hl(0, "GitGutterAdd", { fg = "none", bg = "none" })
hl(0, "GitGutterChange", { fg = "none", bg = "none" })
hl(0, "GitGutterDelete", { fg = "none", bg = "none" })
hl(0, "GitGutterChangeDelete", { fg = "none", bg = "none" })
hl(0, "DiagnosticError", { fg = "none", bg = "none" })
hl(0, "DiagnosticSignError", { fg = "none", bg = "none" })
hl(0, "DiagnosticSignHint", { fg = "none", bg = "none" })
hl(0, "DiagnosticSignInfo", { fg = "none", bg = "none" })
hl(0, "DiagnosticSignWarn", { fg = "none", bg = "none" })
