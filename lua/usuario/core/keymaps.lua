vim.g.mapleader = " "

-- keymaps
vim.keymap.set({ "n", "v", "i" }, "<S-Del>", "<BS>", { desc = "Delete backward (like backspace)" })
vim.keymap.set({ "n", "v", "i" }, "<S-Tab>", "<<", { desc = "Unindent line or selection" })


vim.keymap.set("n", "dd", '"_dd')
vim.keymap.set("n", "cc", '"_cc')

-- Variable para rastrear el estado de Codeium
local codeium_enabled = vim.g.codeium_enabled or true

-- Función para alternar Codeium
local function toggle_codeium()
  codeium_enabled = not codeium_enabled
  vim.g.codeium_enabled = codeium_enabled
  if codeium_enabled then
    print("Codeium Activado")
  else
    print("Codeium Desactivado")
  end
end
local wk = require("which-key")

wk.add({


  -- Aerials
  { "<leader>a",        "<cmd>AerialToggle<CR>",                              desc = "Aerials" },
  -- Grupo para gestión de ventanas
  { "<leader>s",        group = "Window Management" },
  { "<leader>sv",       "<C-w>v",                                             desc = "Split window vertically" },
  { "<leader>sh",       "<C-w>s",                                             desc = "Split window horizontally" },
  { "<leader>se",       "<C-w>=",                                             desc = "Make splits equal size" },
  { "<leader>sq",       "<cmd>close<CR>",                                     desc = "Close current split" },
  { "<leader>sw",       "<C-w>w",                                             desc = "Switch to next window" },
  { "<leader>s<Left>",  "<C-w>h",                                             desc = "Move to left window" },
  { "<leader>s<Down>",  "<C-w>j",                                             desc = "Move to bottom window" },
  { "<leader>s<Up>",    "<C-w>k",                                             desc = "Move to top window" },
  { "<leader>s<Right>", "<C-w>l",                                             desc = "Move to right window" },
  { "<leader>sm",       "<cmd>MaximizerToggle<CR>",                           desc = "Maximize/minimize a split" },

  -- Grupo para gestión de buffers en Bufferline
  { "<leader>b",        group = "Bufferline Management" },
  { "<leader>bo",       "<cmd>BufferLinePick<CR>",                            desc = "Pick buffer" },           -- Seleccionar un buffer visualmente
  { "<leader>bq",       "<cmd>bdelete<CR>",                                   desc = "Close current buffer" },  -- Cierra el buffer actual
  { "<leader>b<Right>", "<cmd>BufferLineCycleNext<CR>",                       desc = "Go to next buffer" },     -- Ir al siguiente buffer
  { "<leader>b<Left>",  "<cmd>BufferLineCyclePrev<CR>",                       desc = "Go to previous buffer" }, -- Ir al buffer anterior
  { "<leader>b1",       "<cmd>BufferLineGoToBuffer 1<CR>",                    desc = "Go to buffer 1" },        -- Ir al buffer 1
  { "<leader>b2",       "<cmd>BufferLineGoToBuffer 2<CR>",                    desc = "Go to buffer 2" },        -- Ir al buffer 2
  { "<leader>b3",       "<cmd>BufferLineGoToBuffer 3<CR>",                    desc = "Go to buffer 3" },        -- Ir al buffer 3
  { "<leader>b4",       "<cmd>BufferLineGoToBuffer 4<CR>",                    desc = "Go to buffer 4" },        -- Ir al buffer 4
  { "<leader>b5",       "<cmd>BufferLineGoToBuffer 5<CR>",                    desc = "Go to buffer 5" },        -- Ir al buffer 5
  { "<leader>b6",       "<cmd>BufferLineGoToBuffer 6<CR>",                    desc = "Go to buffer 6" },        -- Ir al buffer 6
  { "<leader>b7",       "<cmd>BufferLineGoToBuffer 7<CR>",                    desc = "Go to buffer 7" },        -- Ir al buffer 7
  { "<leader>b8",       "<cmd>BufferLineGoToBuffer 8<CR>",                    desc = "Go to buffer 8" },        -- Ir al buffer 8
  { "<leader>b9",       "<cmd>BufferLineGoToBuffer 9<CR>",                    desc = "Go to buffer 9" },        -- Ir al buffer 9
  -- Grupo para Gitsigns
  { "<leader>g",        group = "Gitsigns" },
  { "<leader>gs",       "<cmd>lua require('gitsigns').stage_hunk()<cr>",      desc = "Stage Hunk" },
  { "<leader>gu",       "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
  { "<leader>gr",       "<cmd>lua require('gitsigns').reset_hunk()<cr>",      desc = "Reset Hunk" },
  { "<leader>gp",       "<cmd>lua require('gitsigns').preview_hunk()<cr>",    desc = "Preview Hunk" },
  { "<leader>gb",       "<cmd>lua require('gitsigns').blame_line()<cr>",      desc = "Blame Line" },
  { "<leader>gf",       "<cmd>lua require('gitsigns').diffthis('~1')<cr>",    desc = "Diff This" },
  { "<leader>gn",       "<cmd>lua require('gitsigns').next_hunk()<cr>",       desc = "Next Hunk" },

  -- Grupo para LazyGit
  { "<leader>l",        group = "LazyGit" },
  { "<leader>lg",       "<cmd>LazyGit<cr>",                                   desc = "Open LazyGit" },
  { "<leader>ls",       "<cmd>LazyGitConfig<cr>",                             desc = "Open LazyGit Config" },
  { "<leader>lp",       "<cmd>LazyGitPull<cr>",                               desc = "Pull Changes" },
  { "<leader>lP",       "<cmd>LazyGitPush<cr>",                               desc = "Push Changes" },

  -- Linting
  { "<leader>r",        "<cmd>ToggleFormatOnSave<cr>",                        desc = "Toggle Conform.nvim" },

  -- Grupo para Substitute
  { "<leader>x",        group = "Substitute" },
  { "<leader>xs",       "<cmd>lua require('substitute').operator()<cr>",      desc = "Substitute with motion" },
  { "<leader>xss",      "<cmd>lua require('substitute').line()<cr>",          desc = "Substitute line" },
  { "<leader>xS",       "<cmd>lua require('substitute').eol()<cr>",           desc = "Substitute to end of line" },
  { "<leader>xs",       "<cmd>lua require('substitute').visual()<cr>",        desc = "Substitute in visual mode",      mode = "x" },

  -- Grupo para Telescope
  { "<leader>f",        group = "Telescope" },
  { "<leader>ff",       "<cmd>Telescope find_files<cr>",                      desc = "Fuzzy find files in cwd" },
  { "<leader>fr",       "<cmd>Telescope oldfiles<cr>",                        desc = "Fuzzy find recent files" },
  { "<leader>fs",       "<cmd>Telescope live_grep<cr>",                       desc = "Find string in cwd" },
  { "<leader>fc",       "<cmd>Telescope grep_string<cr>",                     desc = "Find string under cursor in cwd" },

  -- Grupo para Todo Comments
  { "<leader>t",        group = "Todo Comments" },
  {
    "]t",
    function()
      require("todo-comments").jump_next()
    end,
    desc = "Next todo comment",
  },
  {
    "[t",
    function()
      require("todo-comments").jump_prev()
    end,
    desc = "Previous todo comment",
  },
  -- Grupo para Trouble
  { "<leader>x",  group = "Trouble" },
  { "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>",              desc = "Open trouble workspace diagnostics" },
  { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open trouble document diagnostics" },
  { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>",                 desc = "Open trouble quickfix list" },
  { "<leader>xl", "<cmd>Trouble loclist toggle<CR>",                  desc = "Open trouble location list" },
  { "<leader>xt", "<cmd>Trouble todo toggle<CR>",                     desc = "Open todos in trouble" },

  -- Grupo para Maximizer
  { "<leader>s",  group = "Window Management" }, -- Asegurar que este grupo ya exista
  { "<leader>sm", "<cmd>MaximizerToggle<CR>",                         desc = "Maximize/minimize a split" },

  -- Grupo para Neo-tree
  {
    "<leader>e",
    function()
      vim.cmd("Neotree reveal toggle")
    end,
    desc = "Toggle Neo-tree with line numbers and reveal current file",
  },

  -- Mapeo para la terminal
  { "<leader>m",  "<cmd>ToggleTerm<cr>",                                                 desc = "Toggle Terminal" },

  -- Grupo para Codeium
  { "<leader>c",  group = "Codeium" },
  { "<leader>ca", function() return vim.fn["codeium#Accept"]() end,                      desc = "Accept Suggestion",         mode = "i",               expr = true,  silent = true },
  { "<leader>cn", function() return vim.fn end,                                          desc = "Next Suggestion",           mode = "i",               expr = true,  silent = true },
  { "<leader>cp", function() return vim.fn["codeium#CycleCompletions"](-1) end,          desc = "Previous Suggestion",       mode = "i",               expr = true,  silent = true },
  { "<leader>cc", function() return vim.fn["codeium#Clear"]() end,                       desc = "Clear Suggestion",          mode = "i",               expr = true,  silent = true },
  { "<leader>cd", toggle_codeium,                                                        desc = "Toggle Codeium",            mode = { "n", "i", "v" }, silent = true },

  -- Grupo para Telescope
  { "<leader>f",  group = "Telescope" },
  { "<leader>ff", "<cmd>Telescope find_files<CR>",                                       desc = "Find files" },
  { "<leader>fr", "<cmd>Telescope oldfiles<CR>",                                         desc = "Recent files" },
  { "<leader>fs", "<cmd>Telescope live_grep<CR>",                                        desc = "Search in files" },
  { "<leader>fc", "<cmd>Telescope grep_string<CR>",                                      desc = "Search string under cursor" },

  -- Grupo para Goto Preview
  { "<leader>g",  group = "Goto Preview" },
  { "<leader>gd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",      desc = "Preview Definition" },
  { "<leader>gt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", desc = "Preview Type Definition" },
  { "<leader>gi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",  desc = "Preview Implementation" },
  { "<leader>gD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",     desc = "Preview Declaration" },
  { "<leader>gP", "<cmd>lua require('goto-preview').close_all_win()<CR>",                desc = "Close All Previews" },
  { "<leader>gr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>",      desc = "Preview References" },

})
