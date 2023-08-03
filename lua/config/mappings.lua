local map = vim.keymap.set

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jk", "<ESC>")

-- Kill highlight search with esc, and quite buffer with leader Q
map('n', '<esc>', ':noh<CR>', {silent = true})
map('n', '<leader>Q', ':bufdo bdelete<CR>')

-- Reselect visual selection after indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
map('v', 'y', 'myy`y')
map('v', 'Y', 'myY`y')

-- Toggle wrapped
map('n', '<leader>uw', ':set wrap!<CR>', {silent = true} )

-- Move text up and down
map('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
map('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
map('x', '<A-j>', ":move '>+1<CR>gv-gv")
map('x', '<A-k>', ":move '<-2<CR>gv-gv")

-- Resize with arrows
map('n', '<C-Up>', ':resize +2<CR>')
map('n', '<C-Down>', ':resize -2<CR>')
map('n', '<C-Left>', ':vertical resize -2<CR>')
map('n', '<C-Right>', ':vertical resize +2<CR>')

-- Easy insertion of a trailing ; or , from insert mode
-- map('i', ';;', '<Esc>A;<Esc>')
-- map('i', ',,', '<Esc>A,<Esc>')

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- nvimtree
map("n", "<leader>t", "<cmd> NvimTreeFindFileToggle <CR>")
map("n", "<leader>o", "<cmd> NvimTreeFocus <CR>")

-- telescope
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>")
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>")

-- bufferline, cycle buffers
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")

-- lazy git 
map("n", "<leader>gg", "<cmd> LazyGit <CR>")

-- comment.nvim
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end)

map("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
