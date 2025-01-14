vim.g.mapleader = " "

require("set")
-- require("lillilac.lillilac")
require("statusline")
require("presence")
require("nvim-autopairs")
require('lspconfig').pyright.setup{} 
require('lspconfig').clangd.setup{}
require('lspconfig').ts_ls.setup{}
require('Comment').setup()
require("bufferline").setup{}
vim.notify = require("notify")
require("notify")("Hello there! Happy Coding :)")

local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require('harpoon.ui')

-- Add file to Harpoon's list
vim.api.nvim_set_keymap('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })

-- Open Harpoon menu
vim.api.nvim_set_keymap('n', '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })

-- Jump to files in the Harpoon list (1, 2, 3, etc.)
vim.api.nvim_set_keymap('n', '<leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5', ':lua require("harpoon_ui").nav_file(5)<CR>', { noremap = true, silent = true })

-- Remove the current file from Harpoon's list
vim.api.nvim_set_keymap('n', '<leader>r', ':lua require("harpoon.mark").rm_file()<CR>', { noremap = true, silent = true })
-- Cycle through the list
vim.api.nvim_set_keymap('n', '<leader>s', ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':bd<CR>', { noremap = true, silent = true })



local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- Dashboard configuration
require('dashboard').setup {
    theme = 'hyper',  -- Choose your desired theme
    config = {
        header = {
            'Welcome to Neovim!',
            'Use this dashboard to start quickly.',
        },
        center = {
            { icon = '  ', desc = 'Recent files', action = 'Telescope oldfiles', shortcut = 'SPC f h' },
            { icon = '  ', desc = 'New file', action = 'enew', shortcut = 'SPC f n' },
            { icon = '  ', desc = 'Open config', action = 'edit ~/.config/nvim/init.lua', shortcut = 'SPC f c' },
            { icon = '  ', desc = 'Last session', action = 'SessionLoad', shortcut = 'SPC s l' },
        },


        footer = { 
        
          'Have a great day!'

        },
    }
}





-- Configure indent-blankline
require("indent_blankline").setup {
    char = "│",                      -- Character to use for indentation lines
    show_trailing_blankline_indent = false,  -- Hide trailing blankline indent
    show_first_indent_level = true,          -- Show indent on the first level
    use_treesitter = true,                   -- Use Tree-sitter for better accuracy
    filetype_exclude = { "help", "markdown", "text" }, -- Exclude certain filetypes
    buftype_exclude = { "terminal", "nofile" },        -- Exclude certain buffer types
}






require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "mocha",
        dark = "macchiato",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {"italic"},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "github_dark_high_contrast"





vim.api.nvim_set_hl(0, "Delimiter", { fg = "#FFD700" })  -- Gold color for delimiters
vim.api.nvim_set_hl(0, "PunctDelimiter", { fg = "#FFD700" })  -- Gold color for punctuation delimiters
vim.api.nvim_set_hl(0, "Special", { fg = "#FFD700" })  -- Gold color for special characters

-- Initialize plugins
vim.cmd([[packadd packer.nvim]])
require('packer').startup(function(use)

use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  })
  use 'numToStr/Comment.nvim'  
  use {
  'nvim-tree/nvim-tree.lua'
}

  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
   use { 'lukas-reineke/indent-blankline.nvim', tag = 'v2.20.8' }
  use 'wbthomason/packer.nvim'  -- Packer can manage itself
  use 'nvimdev/dashboard-nvim'
  use ({ 'projekt0n/github-nvim-theme' })
  use 'hrsh7th/nvim-cmp'    -- Completion plugin
  use 'hrsh7th/cmp-nvim-lsp'        -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'          -- Buffer completions
  use 'rcarriga/nvim-notify'
  use 'hrsh7th/cmp-path'            -- Path completions
  use 'hrsh7th/cmp-cmdline'         -- Command-line completions
  use 'hrsh7th/cmp-vsnip'           -- Snippet completions
  use 'hrsh7th/vim-vsnip'           -- Snippet engine
  use 'neovim/nvim-lspconfig'       -- Quickstart configurations for the LSP client
  use 'windwp/nvim-autopairs'  -- Autopairs plugin
  use 'joshdick/onedark.vim'
  use 'ThePrimeagen/harpoon'
  use 'nvim-lua/plenary.nvim' 
  use 'lervag/vimtex'           -- A great plugin for TeX and PDF viewing
  use 'folke/noice.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.8'
}

  use { "catppuccin/nvim", as = "catppuccin" }

  -- install without yarn or npm

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })


    use 'mfussenegger/nvim-dap'            -- Core debugger plugin
    use 'rcarriga/nvim-dap-ui'             -- UI for nvim-dap
    use 'theHamsta/nvim-dap-virtual-text'  -- Inline text for debugging
    -- Add specific debugger extensions (optional)
    -- For Python
    use 'mfussenegger/nvim-dap-python'
    -- For JavaScript/TypeScript
    use 'mxsdev/nvim-dap-vscode-js'
    use { "microsoft/vscode-js-debug", run = "npm install --legacy-peer-deps && npm run compile" }
    use 'nvim-neotest/nvim-nio'

end)



-- Automatically install packer if it's not already installed
local function ensure_packer()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


-- Auto compile when there are changes in this file
if packer_bootstrap then
  require('packer').sync()
end

-- Setup nvim-cmp.
local cmp = require'cmp'
local npairs = require('nvim-autopairs')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
    ['<C-Space>'] = cmp.mapping.complete(),             -- Trigger completion
  },
 sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'vsnip' },
  
}})

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.completeopt = { 'menuone', 'noselect' }

vim.api.nvim_exec([[
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap " ""<left>
inoremap ' ''<left>
inoremap < <><left>
]], false)




-- Setup nvim-autopairs
require('nvim-autopairs').setup({
    check_ts = true,  -- Check for treesitter for more intelligent pairing
})

-- Enable autopairs for insert mode
local cmp = require'cmp'
local npairs = require('nvim-autopairs')

cmp.setup({
    -- other cmp setup...
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
})

-- Configure autopairs to delete matching pairs
npairs.setup({
    map_cr = true,  -- Enable mapping of <CR> key
    map_complete = true, -- Enable mapping of <Tab> and <S-Tab>
    fast_wrap = {},  -- Customize fast wrapping settings if desired
})

-- SETUP FOR FILE TREE
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 25,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Toggle nvim-tree with Ctrl + .
vim.api.nvim_set_keymap('n', '<C-.>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


-- DEBUGGER
local dap, dapui = require("dap"), require("dapui")

dapui.setup()  -- Initialize dap-ui with default settings

-- Automatically open dap-ui when dap starts
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
-- Automatically close dap-ui when dap terminates
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end




-- Configure Python debugging
require('dap-python').setup('/usr/bin/python3')  -- Adjust path to debugpy

-- Configure JavaScript/TypeScript debugging
require("dap-vscode-js").setup({
  node_path = "node",  -- Adjust as needed
  debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
  adapters = { "pwa-node" }
})

--KEYBINDING FOR MY DEBUGGER
-- Start/continue debugging
vim.api.nvim_set_keymap('n', '<F5>', ':lua require("dap").continue()<CR>', { noremap = true, silent = true })

-- Step over
vim.api.nvim_set_keymap('n', '<F10>', ':lua require("dap").step_over()<CR>', { noremap = true, silent = true })

-- Step into
vim.api.nvim_set_keymap('n', '<F11>', ':lua require("dap").step_into()<CR>', { noremap = true, silent = true })

-- Step out
vim.api.nvim_set_keymap('n', '<F12>', ':lua require("dap").step_out()<CR>', { noremap = true, silent = true })

-- Toggle breakpoint
vim.api.nvim_set_keymap('n', '<leader>b', ':lua require("dap").toggle_breakpoint()<CR>', { noremap = true, silent = true })

-- Set conditional breakpoint
vim.api.nvim_set_keymap('n', '<leader>B', ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { noremap = true, silent = true })

---END


