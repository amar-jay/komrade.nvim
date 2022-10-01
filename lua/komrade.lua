local cmd = vim.cmd
local fn = vim.fn

local defaults = {
    -- set defaults options here
    comment_italics = true,
}

local M = {
    Color = require('colorbuddy.init').Color,
    colors = require('colorbuddy.init').colors,
    Group = require('colorbuddy.init').Group,
    groups = require('colorbuddy.init').groups,
    styles = require('colorbuddy.init').styles,
}

function M.setup(opts)
    if not opts then opts = {} end

    -- set the option if it doesn't exist
    for k, v in pairs(defaults) do
        if opts[k] == nil then opts[k] = v end
    end

    -- catch typos
    for k, _ in pairs(opts) do
        if defaults[k] == nil then print("komrade theme: unknown setting: ", k) end
    end

    cmd([[
        packadd! komrade.nvim
    ]])

    if fn.exists('syntax_on') then cmd('syntax reset') end
    vim.g.colors_name = "komrade"

    local Color = M.Color
    local colors = M.colors
    local Group = M.Group
    local groups = M.groups
    local styles = M.styles


    Color.new('base03', '#002b36')
    Color.new('base02', '#073642')
    Color.new('base01', '#586e75')
    Color.new('base00', '#657b83')
    Color.new('base0', '#839496')
    Color.new('slate1', '#93a1a1')
    Color.new('slate2', '#eee8d5')
    Color.new('slate3', '#fdf6e3')
    Color.new('cyan', '#2aa198')
    Color.new('magenta', '#d33682')
    Color.new('black', '#002b36')
    Color.new('white', '#ddd')
    Color.new('red', '#ff2230')
    Color.new('orange', '#cb4b16')
    Color.new('yellow', '#b58900')
    Color.new('green', '#719e07')
    Color.new('blue', '#268bd2')
    Color.new('purple', '#6c10c4')
    Color.new('indigo', '#6c1444')
    Color.new('violet', '#6c71c4')

    Color.new('bg', colors.base03)
    Group.new('Error', colors.red)
    Group.new('Warning', colors.yellow)
    Group.new('Information', colors.violet)
    Group.new('Hint', colors.cyan)

    -- normal non-current text
    Group.new('Normal', colors.base0, colors.NONE, styles.NONE)
    Group.new('NormalNC', colors.base0:dark(), colors.NONE, styles.NONE)

    Group.new('Comment', colors.base01, colors.none, opts.comment_italics and styles.italic or styles.NONE)
    Group.new('Constant', colors.cyan, colors.none, styles.NONE)

    -- Any variable name, function or class name
    Group.new('Identifier', colors.blue, colors.none, styles.NONE)

    -- any statement, conditional, repeat (for, do while), label, operator
    Group.new('Statement', colors.green, colors.none, styles.NONE)
    Group.new('PreProc', colors.orange, colors.none, styles.NONE)
    Group.new('Type', colors.yellow, colors.none, styles.NONE)
    Group.new('Special', colors.red, colors.none, styles.NONE)
    Group.new('Underlined', colors.purple, colors.none, styles.NONE)
    Group.new('Ignore', colors.none, colors.none, styles.NONE)
    Group.new('Error', colors.red, colors.none, styles.NONE)
    Group.new('TODO', colors.purple, colors.none, styles.bold)

    Group.new('SpecialKey', colors.base00, colors.base02, styles.bold)
    Group.new('NonText', colors.base00, colors.NONE, styles.bold)
    Group.new('StatusLine', colors.slate1, colors.base02, styles.reverse)
    Group.new('StatusLineNC', colors.base00, colors.base02, styles.reverse)
    Group.new('Visual', colors.base01, colors.base03, styles.reverse)
    Group.new('Directory', colors.blue, colors.none, styles.NONE)
    Group.new('ErrorMsg', colors.red, colors.none, styles.reverse)

    Group.new('IncSearch', colors.orange, colors.none, styles.standout)
    Group.new('Search', colors.yellow, colors.none, styles.reverse)

    Group.new('MoreMsg', colors.blue, colors.none, styles.NONE)
    Group.new('ModeMsg', colors.blue, colors.none, styles.NONE)
    Group.new('Question', colors.cyan, colors.none, styles.bold)
    Group.new('VertSplit', colors.base00, colors.none, styles.NONE)
    Group.new('Title', colors.orange, colors.none, styles.bold)
    Group.new('VisualNOS', colors.none, colors.base02, styles.reverse)
    Group.new('WarningMsg', colors.red, colors.none, styles.NONE)
    Group.new('WildMenu', colors.slate2, colors.base02, styles.reverse)
    Group.new('Folded', colors.base0, colors.base02, styles.bold, colors.base03)
    Group.new('FoldColumn', colors.base0, colors.base02, styles.NONE)

    Group.new('DiffAdd', colors.green, colors.base02, styles.bold, colors.green)
    Group.new('DiffChange', colors.yellow, colors.base02, styles.bold, colors.yellow)
    Group.new('DiffDelete', colors.red, colors.base02, styles.bold)
    Group.new('DiffText', colors.blue, colors.base02, styles.bold, colors.blue)

end

return M
