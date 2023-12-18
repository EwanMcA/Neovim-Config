
vim.keymap.set("n", "<leader>ev", ":e ~/.config/nvim/init.vim<CR>")
vim.keymap.set("n", "<leader>sv", ":source ~/.config/nvim/init.vim<CR>")

vim.keymap.set("n", "E", ":Ex<CR>")

vim.keymap.set("i", "jk", "<Esc>l")
vim.keymap.set("i", "kk", "<Esc>l")
vim.keymap.set("i", "jj", "<Esc>l")

-- misc
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<leader>n", "<cmd>noh<CR>")
vim.keymap.set("n", "<leader>;", "<cmd>set invnumber<CR>")


-- search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader><c-f>", "<cmd>Ag<CR>")
vim.cmd 'nnoremap <c-f> :Ag <C-R><C-W><CR>'


-- Copy
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader><C-s>", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>")

-- surround
vim.keymap.set("n", "<leader>\"", "cs'")
vim.keymap.set("n", "<leader>'", "cs\"\'")

-- Buffers
function ChangeBuffer (forward)
  if forward then
    vim.api.nvim_command(":bn")
  else
    vim.api.nvim_command(":bp")
  end
end
vim.keymap.set("n", "<leader>f", "<cmd>lua ChangeBuffer(true)<CR>")
vim.keymap.set("n", "<leader>b", "<cmd>lua ChangeBuffer(false)<CR>")
vim.keymap.set("n", "<leader>d", ":bp|bd #<CR>")
vim.keymap.set("n", "<leader>g", ":b#<CR>")
vim.keymap.set("n", "<leader>G", ":bm<CR>")
vim.keymap.set("n", "<leader>1", ":b1<CR>")
vim.keymap.set("n", "<leader>2", ":b2<CR>")
vim.keymap.set("n", "<leader>3", ":b3<CR>")
vim.keymap.set("n", "<leader>4", ":b4<CR>")
vim.keymap.set("n", "<leader>5", ":b5<CR>")
vim.keymap.set("n", "<leader>6", ":b6<CR>")
vim.keymap.set("n", "<leader>7", ":b7<CR>")
vim.keymap.set("n", "<leader>8", ":b8<CR>")
vim.keymap.set("n", "<leader>9", ":b9<CR>")

-- FZF
vim.keymap.set("n", "<leader>l", "<cmd>Buffers<CR>")
vim.keymap.set("n", "<c-p>", "<cmd>GFiles<CR>")
vim.keymap.set("n", "<leader>p", "<cmd>FZF<CR>")

-- Git
vim.api.nvim_create_user_command( "GB", "Git blame", {})
vim.keymap.set("n", "<leader><leader>g", "<cmd>GBrowse<CR>")
