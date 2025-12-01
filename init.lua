--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Tab and indentation settings
vim.o.tabstop = 4        -- Number of spaces a tab character represents
vim.o.shiftwidth = 4     -- Number of spaces for each indentation level
vim.o.expandtab = true   -- Convert tabs to spaces
vim.o.softtabstop = 4    -- Number of spaces when pressing tab in insert mode

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Show 80-character line
vim.o.colorcolumn = '80'

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Map jk to escape in insert mode
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode with jk' })

-- Line navigation shortcuts
vim.keymap.set('n', '<leader>hh', '^', { desc = 'Go to beginning of line' })
vim.keymap.set('n', '<leader>ll', '$', { desc = 'Go to end of line' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Mouse back/forward buttons for jump list (like VSCode/browser navigation)
vim.keymap.set('n', '<X1Mouse>', '<C-o>', { desc = 'Jump back (mouse back button)' })
vim.keymap.set('n', '<X2Mouse>', '<C-i>', { desc = 'Jump forward (mouse forward button)' })

-- Scroll wheel moves viewport, cursor stays in place (like VSCode)
vim.keymap.set('n', '<ScrollWheelUp>', '3<C-y>', { desc = 'Scroll up (cursor stays)' })
vim.keymap.set('n', '<ScrollWheelDown>', '3<C-e>', { desc = 'Scroll down (cursor stays)' })

-- Git blame
vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns blame_line<CR>', { desc = '[G]it [B]lame line' })

-- Easier split management (VSCode-like)
vim.keymap.set('n', '<leader>\\', '<cmd>vsplit<CR>', { desc = 'Split vertical |' })
vim.keymap.set('n', '<leader>-', '<cmd>split<CR>', { desc = 'Split horizontal -' })
vim.keymap.set('n', '<leader>wx', '<cmd>close<CR>', { desc = '[W]indow close [X]' })
vim.keymap.set('n', '<leader>wo', '<cmd>only<CR>', { desc = '[W]indow [O]nly (close others)' })
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = '[W]indow [=]equalize' })

-- Send current file to new tmux pane (opens there, closes here)
vim.keymap.set('n', '<leader>ts', function()
  local file = vim.fn.expand('%:p')
  local cwd = vim.fn.getcwd()  -- Use nvim's working directory (project root)
  if file == '' then
    print('No file to send')
    return
  end
  -- Create new tmux split at same project root, open file and tree
  vim.fn.system('tmux split-window -h -c "' .. cwd .. '" "nvim \'' .. file .. '\' -c NvimTreeOpen"')
  -- Close buffer here
  vim.cmd('bd')
end, { desc = '[T]mux [S]end file to new pane' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Remove trailing whitespace on modified lines when saving
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Remove trailing whitespace on modified lines',
  group = vim.api.nvim_create_augroup('trim-whitespace', { clear = true }),
  callback = function()
    local save_cursor = vim.fn.getpos('.')
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos('.', save_cursor)
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
  --

  -- Alternatively, use `config = function() ... end` for full control over the configuration.
  -- If you prefer to call `setup` explicitly, use:
  --    {
  --        'lewis6991/gitsigns.nvim',
  --        config = function()
  --            require('gitsigns').setup({
  --                -- Your gitsigns configuration here
  --            })
  --        end,
  --    }
  --
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`.
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.o.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>c', group = '[C]laude Code', mode = { 'n', 'v' } },
        { '<leader>x', group = 'Trouble/Diagnostics' },
      },
    },
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },
    config = function()
      -- Brief aside: **What is LSP?**
      --
      -- LSP is an initialism you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

          -- Find references for the word under your cursor.
          map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

          -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Diagnostic Config (VSCode-like: no inline text, show on hover)
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = {
          border = 'rounded',
          source = true,
          header = '',
          prefix = '',
        },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = false,  -- Disable inline errors
      }

      -- Show diagnostics on hover (like VSCode)
      vim.api.nvim_create_autocmd('CursorHold', {
        callback = function()
          vim.diagnostic.open_float(nil, { focusable = false })
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        -- ts_ls = {},

        -- Rust Language Server
        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = {
              checkOnSave = {
                command = 'clippy',
              },
              cargo = {
                allFeatures = true,
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },

        -- Go Language Server
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
              gofumpt = true,
            },
          },
        },

        -- TypeScript/JavaScript Language Server
        ts_ls = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
              },
            },
          },
        },

        -- Python Type Checking
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = 'basic',
                diagnosticMode = 'openFilesOnly',  -- workspace can be slow on large repos
                inlayHints = {
                  variableTypes = false,
                  functionReturnTypes = true,
                },
              },
            },
          },
        },

        -- Python Linting (ruff is way faster than pylint/flake8)
        ruff = {
          init_options = {
            settings = {
              -- Use ruff.toml or pyproject.toml from project if exists
              -- Otherwise falls back to defaults
              args = {},
            },
          },
        },

        lua_ls = {
          -- cmd = { ... },
          -- filetypes = { ... },
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --
      -- To check the current status of installed tools and/or manually install
      -- other tools, you can run
      --    :Mason
      --
      -- You can press `g?` for help in this menu.
      --
      -- `mason` had to be setup earlier: to configure its options see the
      -- `dependencies` table for `nvim-lspconfig` above.
      --
      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Lua formatter
        'ruff',   -- Python linter + formatter (replaces black, isort, flake8, pylint)
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = false,  -- Disabled - use <leader>f to format manually
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_format', 'ruff_fix' },  -- ruff handles formatting + import sorting
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
      formatters = {
        -- Ruff will auto-detect ruff.toml or pyproject.toml in project
        -- Set RUFF_CONFIG env var to override
        ruff_format = {
          prepend_args = function()
            local ruff_config = vim.env.RUFF_CONFIG
            if ruff_config then
              return { '--config', ruff_config }
            end
            return {}
          end,
        },
      },
    },
  },

  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        -- 'default' (recommended) for mappings similar to built-in completions
        --   <c-y> to accept ([y]es) the completion.
        --    This will auto-import if your LSP supports it.
        --    This will expand snippets if the LSP sent a snippet.
        -- 'super-tab' for tab to accept
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- For an understanding of why the 'default' preset is recommended,
        -- you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        --
        -- All presets have the following mappings:
        -- <tab>/<s-tab>: move to right/left of your snippet expansion
        -- <c-space>: Open menu or open docs if already open
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
        -- <c-e>: Hide menu
        -- <c-k>: Toggle signature help
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        preset = 'default',

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      snippets = { preset = 'luasnip' },

      -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
      -- which automatically downloads a prebuilt binary when enabled.
      --
      -- By default, we use the Lua implementation instead, but you may enable
      -- the rust implementation via `'prefer_rust_with_warning'`
      --
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = { implementation = 'lua' },

      -- Shows a signature help window while you type arguments for a function
      signature = { enabled = true },
    },
  },

  { -- Custom Dark Purple theme matching VSCode config
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    config = function()
      require('onedarkpro').setup {
        colors = {
          -- Base colors matching VSCode config
          bg = '#050505',
          fg = '#e0e0e0',
          cursorline = '#1a1a2e',
          selection = '#3d2066',  -- Purple at ~50% opacity on dark bg
          comment = '#606060',
          -- Syntax colors
          purple = '#9d4edd',
          yellow = '#ffc300',
          green = '#50fa7b',
          blue = '#0044ff',
          red = '#e84057',
          orange = '#ff8c00',
          cyan = '#6b9bd1',
        },
        highlights = {
          -- Editor UI
          Normal = { bg = '#050505', fg = '#e0e0e0' },
          NormalFloat = { bg = '#121218' },
          FloatBorder = { fg = '#9d4edd' },
          CursorLine = { bg = '#1a1a2e' },
          CursorLineNr = { fg = '#9d4edd' },
          LineNr = { fg = '#606060' },
          Visual = { bg = '#3d2066' },
          Search = { bg = '#3d2066' },
          IncSearch = { bg = '#9d4edd', fg = '#050505' },

          -- Syntax - matching VSCode exactly
          Comment = { fg = '#606060', italic = true },
          Keyword = { fg = '#ffc300', bold = true },
          Conditional = { fg = '#ffc300', bold = true },
          Repeat = { fg = '#ffc300', bold = true },
          Statement = { fg = '#ffc300', bold = true },
          StorageClass = { fg = '#ffc300', bold = true },
          Type = { fg = '#007038' },
          Function = { fg = '#6d28d9' },
          String = { fg = '#50fa7b' },
          Number = { fg = '#0044ff' },
          Boolean = { fg = '#0044ff' },
          Constant = { fg = '#0044ff' },
          Operator = { fg = '#ffffff' },
          Delimiter = { fg = '#e0e0e0' },  -- White for , ; :
          Identifier = { fg = '#e0e0e0' },
          Special = { fg = '#9d4edd' },

          -- Treesitter specific
          ['@keyword'] = { fg = '#ffc300', bold = true },
          ['@keyword.return'] = { fg = '#ffc300', bold = true },
          ['@keyword.function'] = { fg = '#ffc300', bold = true },
          ['@keyword.operator'] = { fg = '#ffc300', bold = true },
          ['@conditional'] = { fg = '#ffc300', bold = true },
          ['@repeat'] = { fg = '#ffc300', bold = true },
          ['@function'] = { fg = '#6d28d9' },
          ['@function.call'] = { fg = '#6d28d9' },
          ['@function.builtin'] = { fg = '#6d28d9' },
          ['@method'] = { fg = '#6d28d9' },
          ['@method.call'] = { fg = '#6d28d9' },
          ['@type'] = { fg = '#007038' },
          ['@type.builtin'] = { fg = '#007038' },
          ['@class'] = { fg = '#007038' },
          ['@constructor'] = { fg = '#007038' },
          ['@variable'] = { fg = '#e0e0e0' },
          ['@variable.member'] = { fg = '#e84057' },  -- obj.property access
          ['@variable.builtin'] = { fg = '#e0e0e0' },  -- self, cls
          ['@variable.parameter'] = { fg = '#e0e0e0' },
          ['@parameter'] = { fg = '#e0e0e0' },
          ['@property'] = { fg = '#e84057' },  -- Only for property ACCESS (obj.prop)
          ['@field'] = { fg = '#e0e0e0' },     -- Field definitions should be white
          ['@lsp.type.variable'] = { fg = '#e0e0e0' },
          ['@lsp.type.parameter'] = { fg = '#e0e0e0' },
          ['@lsp.type.namespace'] = { fg = '#e0e0e0' },  -- Module/namespace names white
          ['@module'] = { fg = '#e0e0e0' },              -- Module names white
          ['@namespace'] = { fg = '#e0e0e0' },           -- Namespace names white
          ['@attribute'] = { fg = '#ff8c00' },
          ['@decorator'] = { fg = '#ff8c00' },
          ['@string'] = { fg = '#50fa7b' },
          ['@string.escape'] = { fg = '#9d4edd' },
          ['@number'] = { fg = '#0044ff' },
          ['@boolean'] = { fg = '#0044ff' },
          ['@constant'] = { fg = '#0044ff' },
          ['@constant.builtin'] = { fg = '#0044ff' },
          ['@operator'] = { fg = '#ffffff' },
          ['@punctuation.bracket'] = { fg = '#ffc300' },  -- () [] {} - gold
          ['@punctuation.delimiter'] = { fg = '#e0e0e0' },  -- , ; : - white
          ['@punctuation.special'] = { fg = '#ffc300' },   -- String interpolation brackets - gold
          ['@comment'] = { fg = '#606060', italic = true },

          -- Matching parens and brackets - all gold
          MatchParen = { fg = '#ffc300', bg = '#3d2066', bold = true },

          -- Rainbow bracket overrides (force all to gold)
          RainbowDelimiterRed = { fg = '#ffc300' },
          RainbowDelimiterYellow = { fg = '#ffc300' },
          RainbowDelimiterBlue = { fg = '#ffc300' },
          RainbowDelimiterOrange = { fg = '#ffc300' },
          RainbowDelimiterGreen = { fg = '#ffc300' },
          RainbowDelimiterViolet = { fg = '#ffc300' },
          RainbowDelimiterCyan = { fg = '#ffc300' },

          -- Brackets gold, delimiters white
          ['@lsp.type.punctuation'] = { fg = '#ffc300' },
          ['@punctuation'] = { fg = '#ffc300' },
          -- Rust
          ['@punctuation.bracket.rust'] = { fg = '#ffc300' },
          ['@punctuation.delimiter.rust'] = { fg = '#e0e0e0' },
          ['@odp.punctuation_arguments_brackets.rust'] = { fg = '#ffc300' },
          -- Python
          ['@punctuation.bracket.python'] = { fg = '#ffc300' },
          ['@punctuation.delimiter.python'] = { fg = '#e0e0e0' },
          ['@odp.base_constructor.python'] = { fg = '#6d28d9' },  -- __init__ etc
          ['@constructor.python'] = { fg = '#6d28d9' },  -- __init__ etc
          ['@keyword.python'] = { fg = '#ffc300', bold = true },
          ['@keyword.function.python'] = { fg = '#ffc300', bold = true },
          ['@keyword.return.python'] = { fg = '#ffc300', bold = true },
          ['@keyword.operator.python'] = { fg = '#ffc300', bold = true },
          ['@conditional.python'] = { fg = '#ffc300', bold = true },
          ['@repeat.python'] = { fg = '#ffc300', bold = true },
          ['@function.python'] = { fg = '#6d28d9' },
          ['@function.call.python'] = { fg = '#6d28d9' },
          ['@function.builtin.python'] = { fg = '#6d28d9' },
          ['@method.python'] = { fg = '#6d28d9' },
          ['@method.call.python'] = { fg = '#6d28d9' },
          ['@type.python'] = { fg = '#007038' },
          ['@type.builtin.python'] = { fg = '#007038' },
          ['@class.python'] = { fg = '#007038' },
          ['@constructor.python'] = { fg = '#007038' },
          ['@variable.python'] = { fg = '#e0e0e0' },
          ['@variable.builtin.python'] = { fg = '#e0e0e0' },  -- self, cls
          ['@variable.parameter.python'] = { fg = '#e0e0e0' },
          ['@parameter.python'] = { fg = '#e0e0e0' },
          ['@property.python'] = { fg = '#e84057' },
          ['@field.python'] = { fg = '#e0e0e0' },
          ['@attribute.python'] = { fg = '#ff8c00' },  -- decorators
          ['@decorator.python'] = { fg = '#ff8c00' },
          ['@string.python'] = { fg = '#50fa7b' },
          ['@number.python'] = { fg = '#0044ff' },
          ['@boolean.python'] = { fg = '#0044ff' },
          ['@constant.python'] = { fg = '#0044ff' },
          ['@constant.builtin.python'] = { fg = '#0044ff' },
          ['@operator.python'] = { fg = '#ffffff' },
          ['@module.python'] = { fg = '#e0e0e0' },
          ['@namespace.python'] = { fg = '#e0e0e0' },
          -- Go
          ['@punctuation.bracket.go'] = { fg = '#ffc300' },
          ['@punctuation.delimiter.go'] = { fg = '#e0e0e0' },
          -- Lua
          ['@punctuation.bracket.lua'] = { fg = '#ffc300' },
          ['@punctuation.delimiter.lua'] = { fg = '#e0e0e0' },
          -- JavaScript
          ['@punctuation.bracket.javascript'] = { fg = '#ffc300' },
          ['@punctuation.delimiter.javascript'] = { fg = '#e0e0e0' },
          -- TypeScript
          ['@punctuation.bracket.typescript'] = { fg = '#ffc300' },
          ['@punctuation.delimiter.typescript'] = { fg = '#e0e0e0' },

          -- Git signs
          GitSignsAdd = { fg = '#50fa7b' },
          GitSignsChange = { fg = '#0044ff' },
          GitSignsDelete = { fg = '#e84057' },

          -- Diagnostics
          DiagnosticError = { fg = '#e84057' },
          DiagnosticWarn = { fg = '#ffc300' },
          DiagnosticInfo = { fg = '#6b9bd1' },
          DiagnosticHint = { fg = '#9d4edd' },

          -- NvimTree
          NvimTreeNormal = { bg = '#050505' },
          NvimTreeFolderIcon = { fg = '#9d4edd' },
          NvimTreeFolderName = { fg = '#e0e0e0' },
          NvimTreeOpenedFolderName = { fg = '#9d4edd' },
          NvimTreeRootFolder = { fg = '#9d4edd', bold = true },
          NvimTreeGitDirty = { fg = '#ffc300' },      -- Modified
          NvimTreeGitStaged = { fg = '#50fa7b' },     -- Staged
          NvimTreeGitNew = { fg = '#50fa7b' },        -- Untracked
          NvimTreeGitDeleted = { fg = '#e84057' },    -- Deleted
          NvimTreeGitRenamed = { fg = '#6b9bd1' },    -- Renamed
          NvimTreeGitMerge = { fg = '#e84057' },      -- Conflict
          NvimTreeGitIgnored = { fg = '#606060' },    -- Ignored

          -- Bufferline
          BufferLineFill = { bg = '#050505' },
          BufferLineBackground = { bg = '#050505', fg = '#606060' },
          BufferLineBufferSelected = { bg = '#1a1a2e', fg = '#e0e0e0', bold = true },
          BufferLineIndicatorSelected = { fg = '#9d4edd' },
        },
        styles = {
          comments = 'italic',
          keywords = 'NONE',
          functions = 'NONE',
          variables = 'NONE',
        },
        options = {
          cursorline = true,
          transparency = false,
          terminal_colors = true,
        },
      }
      vim.cmd.colorscheme 'onedark_dark'

      -- Force syntax highlights for ALL languages after colorscheme loads
      vim.api.nvim_create_autocmd('ColorScheme', {
        callback = function()
          -- These apply to all languages
          local highlights = {
            -- Keywords - gold bold
            ['@keyword'] = { fg = '#ffc300', bold = true },
            ['@keyword.return'] = { fg = '#ffc300', bold = true },
            ['@keyword.function'] = { fg = '#ffc300', bold = true },
            ['@keyword.operator'] = { fg = '#ffc300', bold = true },
            ['@keyword.conditional'] = { fg = '#ffc300', bold = true },
            ['@keyword.repeat'] = { fg = '#ffc300', bold = true },
            ['@keyword.import'] = { fg = '#ffc300', bold = true },
            ['@keyword.exception'] = { fg = '#ffc300', bold = true },
            ['@conditional'] = { fg = '#ffc300', bold = true },
            ['@repeat'] = { fg = '#ffc300', bold = true },
            ['@exception'] = { fg = '#ffc300', bold = true },
            ['@include'] = { fg = '#ffc300', bold = true },
            -- Functions - lavender
            ['@function'] = { fg = '#6d28d9' },
            ['@function.call'] = { fg = '#6d28d9' },
            ['@function.builtin'] = { fg = '#6d28d9' },
            ['@function.method'] = { fg = '#6d28d9' },
            ['@function.method.call'] = { fg = '#6d28d9' },
            ['@method'] = { fg = '#6d28d9' },
            ['@method.call'] = { fg = '#6d28d9' },
            -- Types - dark green
            ['@type'] = { fg = '#007038' },
            ['@type.builtin'] = { fg = '#007038' },
            ['@type.definition'] = { fg = '#007038' },
            ['@class'] = { fg = '#007038' },
            ['@constructor'] = { fg = '#6d28d9' },  -- __init__ etc should be function color
            -- Variables - white
            ['@variable'] = { fg = '#e0e0e0' },
            ['@variable.parameter'] = { fg = '#e0e0e0' },
            ['@variable.member'] = { fg = '#e84057' },
            ['@variable.builtin'] = { fg = '#e0e0e0' },  -- self, cls
            ['@parameter'] = { fg = '#e0e0e0' },
            ['@field'] = { fg = '#e0e0e0' },
            ['@property'] = { fg = '#e84057' },
            -- Modules/namespaces - white
            ['@module'] = { fg = '#e0e0e0' },
            ['@namespace'] = { fg = '#e0e0e0' },
            -- Strings - green
            ['@string'] = { fg = '#50fa7b' },
            ['@string.escape'] = { fg = '#9d4edd' },
            ['@string.special'] = { fg = '#9d4edd' },
            ['@character'] = { fg = '#50fa7b' },
            -- Numbers/constants - blue
            ['@number'] = { fg = '#0044ff' },
            ['@number.float'] = { fg = '#0044ff' },
            ['@boolean'] = { fg = '#0044ff' },
            ['@constant'] = { fg = '#0044ff' },
            ['@constant.builtin'] = { fg = '#0044ff' },
            -- Decorators - orange
            ['@attribute'] = { fg = '#ff8c00' },
            ['@decorator'] = { fg = '#ff8c00' },
            -- Operators - white
            ['@operator'] = { fg = '#ffffff' },
            -- Punctuation - brackets gold, delimiters white
            ['@punctuation.bracket'] = { fg = '#ffc300' },
            ['@punctuation.delimiter'] = { fg = '#e0e0e0' },
            ['@punctuation.special'] = { fg = '#ffc300' },
            -- Comments
            ['@comment'] = { fg = '#606060', italic = true },
          }

          for group, opts in pairs(highlights) do
            vim.api.nvim_set_hl(0, group, opts)
          end
        end,
      })

      -- Trigger it now too
      vim.api.nvim_exec_autocmds('ColorScheme', {})
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Disable mini.statusline since we'll use lualine
      -- local statusline = require 'mini.statusline'
      -- statusline.setup { use_icons = vim.g.have_nerd_font }

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'go', 'html', 'javascript', 'json', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'python', 'query', 'rust', 'toml', 'typescript', 'tsx', 'vim', 'vimdoc', 'yaml' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },

  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- Lualine (statusline)
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- Custom purple theme matching VSCode/tmux/Ghostty
      local purple_theme = {
        normal = {
          a = { bg = '#9d4edd', fg = '#050505', gui = 'bold' },
          b = { bg = '#1a1a2e', fg = '#e0e0e0' },
          c = { bg = '#121218', fg = '#a0a0a0' },
        },
        insert = {
          a = { bg = '#50fa7b', fg = '#050505', gui = 'bold' },
          b = { bg = '#1a1a2e', fg = '#e0e0e0' },
          c = { bg = '#121218', fg = '#a0a0a0' },
        },
        visual = {
          a = { bg = '#ffc300', fg = '#050505', gui = 'bold' },
          b = { bg = '#1a1a2e', fg = '#e0e0e0' },
          c = { bg = '#121218', fg = '#a0a0a0' },
        },
        replace = {
          a = { bg = '#e84057', fg = '#050505', gui = 'bold' },
          b = { bg = '#1a1a2e', fg = '#e0e0e0' },
          c = { bg = '#121218', fg = '#a0a0a0' },
        },
        command = {
          a = { bg = '#9d4edd', fg = '#050505', gui = 'bold' },
          b = { bg = '#1a1a2e', fg = '#e0e0e0' },
          c = { bg = '#121218', fg = '#a0a0a0' },
        },
        inactive = {
          a = { bg = '#121218', fg = '#606060' },
          b = { bg = '#121218', fg = '#606060' },
          c = { bg = '#121218', fg = '#606060' },
        },
      }

      require('lualine').setup {
        options = {
          theme = purple_theme,
          component_separators = '|',
          section_separators = { left = '', right = '' },
          globalstatus = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
    end,
  },

  -- Bufferline (tabs)
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'buffers',
          numbers = 'none',
          diagnostics = 'nvim_lsp',
          separator_style = 'slant',
          show_buffer_close_icons = true,  -- Show X on tabs like VSCode
          show_close_icon = false,
          color_icons = true,
          -- Make clicking tabs work
          left_mouse_command = 'buffer %d',  -- Click to switch
          middle_mouse_command = 'bdelete! %d',  -- Middle click to close
          right_mouse_command = 'vertical sbuffer %d',  -- Right click opens in split
          -- Keep tabs visible even with one buffer
          always_show_bufferline = true,
          -- Show tab index numbers so you can jump with <leader>1, <leader>2, etc
          numbers = function(opts)
            return string.format('%s', opts.ordinal)
          end,
        },
      }
      -- Keymaps for buffer navigation
      vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
      vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
      vim.keymap.set('n', '<leader>x', '<cmd>bd<CR>', { desc = 'Close buffer' })
      -- Jump to buffer by number (like VSCode Ctrl+1, Ctrl+2, etc)
      vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', { desc = 'Go to buffer 1' })
      vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', { desc = 'Go to buffer 2' })
      vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', { desc = 'Go to buffer 3' })
      vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', { desc = 'Go to buffer 4' })
      vim.keymap.set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', { desc = 'Go to buffer 5' })
      vim.keymap.set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', { desc = 'Go to buffer 6' })
      vim.keymap.set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', { desc = 'Go to buffer 7' })
      vim.keymap.set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', { desc = 'Go to buffer 8' })
      vim.keymap.set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', { desc = 'Go to buffer 9' })
      -- Reorder tabs (since drag doesn't work)
      vim.keymap.set('n', '<A-h>', '<cmd>BufferLineMovePrev<CR>', { desc = 'Move tab left' })
      vim.keymap.set('n', '<A-l>', '<cmd>BufferLineMoveNext<CR>', { desc = 'Move tab right' })
    end,
  },

  -- File explorer (nvim-tree)
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local function on_attach(bufnr)
        local api = require('nvim-tree.api')

        -- Default NvimTree mappings
        api.config.mappings.default_on_attach(bufnr)

        -- Telescope overrides (work even when focused on tree)
        local builtin = require('telescope.builtin')
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set('n', '<leader>sf', builtin.find_files, opts)
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, opts)
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, opts)
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, opts)
      end

      require('nvim-tree').setup {
        on_attach = on_attach,
        view = {
          width = 30,
          side = 'left',
          preserve_window_proportions = true,
        },
        renderer = {
          highlight_git = true,
          highlight_opened_files = 'name',  -- Highlight open files in tree
          indent_markers = {
            enable = true,  -- Show indent guides like VSCode
          },
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
            glyphs = {
              git = {
                unstaged = '●',
                staged = '✓',
                unmerged = '',
                renamed = '➜',
                untracked = '★',
                deleted = '',
                ignored = '◌',
              },
            },
          },
        },
        filters = {
          dotfiles = false,
        },
        git = {
          enable = true,
          ignore = false,
        },
        actions = {
          open_file = {
            quit_on_open = false,  -- Keep tree open when opening file (like VSCode)
            window_picker = {
              enable = false,  -- Open in previous window, don't ask which split
            },
          },
        },
        -- Sync tree with current file automatically
        update_focused_file = {
          enable = true,
          update_root = false,
        },
      }
      vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
      vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFile<CR>', { desc = 'Find file in explorer' })
    end,
  },

  -- Indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup {
        indent = {
          char = '│',
          tab_char = '│',
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = false,
        },
        exclude = {
          filetypes = {
            'help',
            'alpha',
            'dashboard',
            'nvim-tree',
            'Trouble',
            'lazy',
            'mason',
          },
        },
      }
    end,
  },

  -- Color highlighting
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        'css',
        'scss',
        'html',
        'javascript',
        'typescript',
        'python',
        'lua',
      }
    end,
  },

  -- Auto-save (DISABLED - was interfering with Claude Code diff view)
  -- {
  --   'pocco81/auto-save.nvim',
  --   config = function()
  --     require('auto-save').setup {
  --       enabled = true,
  --       execution_message = {
  --         message = function()
  --           return ('AutoSave: saved at ' .. vim.fn.strftime('%H:%M:%S'))
  --         end,
  --         dim = 0.18,
  --         cleaning_interval = 1250,
  --       },
  --       trigger_events = { 'InsertLeave' },
  --       condition = function(buf)
  --         local fn = vim.fn
  --         local utils = require('auto-save.utils.data')
  --         if fn.getbufvar(buf, '&modifiable') == 1 and utils.not_in(fn.getbufvar(buf, '&filetype'), {}) then
  --           return true
  --         end
  --         return false
  --       end,
  --       write_all_buffers = false,
  --       debounce_delay = 135,
  --     }
  --   end,
  -- },

  -- Session management
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    config = function()
      require('persistence').setup {
        dir = vim.fn.stdpath('state') .. '/sessions/',
        options = { 'buffers', 'curdir', 'tabpages', 'winsize' },
      }
      vim.keymap.set('n', '<leader>qs', function()
        require('persistence').load()
      end, { desc = 'Restore session' })
      vim.keymap.set('n', '<leader>ql', function()
        require('persistence').load { last = true }
      end, { desc = 'Restore last session' })
      vim.keymap.set('n', '<leader>qd', function()
        require('persistence').stop()
      end, { desc = 'Stop session recording' })
    end,
  },

  -- Auto-pairs (auto-close brackets, quotes, etc.)
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      check_ts = true, -- Use treesitter to check for pairs
    },
  },

  -- Multi-cursor support (VSCode-style Ctrl+click, Ctrl+d)
  {
    'brenton-leighton/multiple-cursors.nvim',
    version = '*',
    opts = {},
    keys = {
      { '<C-LeftMouse>', '<Cmd>MultipleCursorsMouseAddDelete<CR>', mode = { 'n', 'i' }, desc = 'Add/remove cursor' },
      { '<C-Down>', '<Cmd>MultipleCursorsAddDown<CR>', mode = { 'n', 'i' }, desc = 'Add cursor down' },
      { '<C-Up>', '<Cmd>MultipleCursorsAddUp<CR>', mode = { 'n', 'i' }, desc = 'Add cursor up' },
      { '<C-d>', '<Cmd>MultipleCursorsAddJumpNextMatch<CR>', mode = { 'n', 'x' }, desc = 'Add cursor to next match' },
    },
  },

  -- Undotree (visual undo history)
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', '<Cmd>UndotreeToggle<CR>', desc = '[U]ndotree toggle' },
    },
  },

  -- Trouble (better diagnostics panel)
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
      { '<leader>xx', '<Cmd>Trouble diagnostics toggle<CR>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xX', '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>', desc = 'Buffer Diagnostics (Trouble)' },
      { '<leader>xs', '<Cmd>Trouble symbols toggle focus=false<CR>', desc = 'Symbols (Trouble)' },
      { '<leader>xq', '<Cmd>Trouble qflist toggle<CR>', desc = 'Quickfix (Trouble)' },
    },
  },

  -- Flash (jump anywhere in 3 keystrokes)
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash jump' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash treesitter' },
      { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Flash remote' },
      { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Flash treesitter search' },
    },
  },

  -- Snacks.nvim utilities (used by claudecode + standalone features)
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      -- Disable LSP/treesitter for large files (>1.5MB) to prevent freezing
      bigfile = { enabled = true },
      -- Render file content before plugins load for faster startup
      quickfile = { enabled = true },
      -- Auto-highlight LSP references under cursor + jump between them
      words = {
        enabled = true,
        debounce = 200,
      },
    },
    keys = {
      -- Jump between LSP references with [[ and ]]
      { ']]', function() require('snacks').words.jump(1, true) end, desc = 'Next reference' },
      { '[[', function() require('snacks').words.jump(-1, true) end, desc = 'Prev reference' },
    },
  },

  -- Claude Code integration (AI coding assistant)
  {
    'coder/claudecode.nvim',
    dependencies = {
      'folke/snacks.nvim',
    },
    config = function()
      require('claudecode').setup({
        -- Terminal settings
        terminal = {
          split_side = 'right',
          split_width_percentage = 0.4,
        },
        -- Explicitly use the correct claude binary
        terminal_cmd = vim.fn.expand('~/.claude/local/claude'),
      })

      -- Keymaps for Claude Code
      vim.keymap.set('n', '<leader>cc', '<cmd>ClaudeCode<CR>', { desc = '[C]laude [C]ode toggle' })
      vim.keymap.set('n', '<leader>cf', '<cmd>ClaudeCodeFocus<CR>', { desc = '[C]laude [F]ocus' })
      vim.keymap.set('v', '<leader>cs', '<cmd>ClaudeCodeSend<CR>', { desc = '[C]laude [S]end selection' })
      vim.keymap.set('n', '<leader>ca', '<cmd>ClaudeCodeTreeAdd<CR>', { desc = '[C]laude [A]dd file from tree' })
    end,
  },

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
