
vim.keymap.set("n", "<leader>ev", ":e ~/.config/nvim/init.vim<CR>")
vim.keymap.set("n", "<leader>cs", ":e ~/.config/nvim/README.md<CR>")
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

-- Terminal
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>") CLASH WITH CHANGE TAB

-- project commands
local function runOnCurrentFile(util)
  local path = vim.fn.expand("%:p")
  local filename = vim.fn.expand("%:gs?/home/emcandrew/dev/\\w*/??")
  local type = vim.fn.expand("%:e")
  local cmd = "T echo 'No test runner found'"

  if type == "py" then
    if path:match("dev/cwa") then
      cmd = "T cwa; docker compose run --rm cwa " .. util .. " " .. filename
    elseif path:match("dev/cds") then
      cmd = "T cds; docker compose run --rm cds " .. util .. " " .. filename
    elseif path:match("dev/generative") then
      cmd = "T gas; make docker/build/test; docker run -it --rm --network gas-test-network gas:test pytest -vv " .. filename
    else
      cmd = "T cat " .. path
    end
  end
  if type == "js" or type == "ts" or type == "tsx" then
    if path:match("dev/cwa") then
      cmd = "T cd frontend; yarn test " .. filename
    else
      cmd = "T yarn test " .. filename
    end
  end

  vim.api.nvim_command(cmd)
  vim.api.nvim_command("Topen")
end
vim.keymap.set("n", "<F2>", function() runOnCurrentFile("pytest -vv") end)
vim.keymap.set("n", "<leader><F2>", function() runOnCurrentFile("black") end)

vim.api.nvim_create_user_command("Pdb", function()
    local input = 'import pdb; pdb.set_trace()'
    vim.api.nvim_input('o' .. input .. '<ESC>>>==')
  end
, {})

-- notes
vim.api.nvim_command("autocmd BufWritePost *_*_*.md :!TODAY_DIR=~/dev/notes python ~/dev/notes/parse.py %")

-- llm
-- function takes a string arg which gets passed the llm cli
--vim.api.nvim_create_user_command("LLM", function(params)
  ---- execute 'new' | execute 'r !llm "respond with one line containing one word with mardown bold format"' | execute 'set syntax=markdown'
  --vim.api.nvim_command("new")
  --vim.api.nvim_command("r !llm " .. params["args"])
  --vim.api.nvim_command("set syntax=markdown")
--end, {})

vim.api.nvim_create_user_command("LLM", function(opts)
  local visual_selection = ""

  -- Check if we're in visual mode and get the selected text.
  if opts.range then -- a range was provided to the command (meaning visual mode)
    local start_line, start_col = unpack(vim.api.nvim_buf_get_mark(0, "<"))  -- line, col
    local end_line, end_col = unpack(vim.api.nvim_buf_get_mark(0, ">"))   --line, col

    -- adjust to use inclusive indexing
    start_col = start_col + 1
    end_col = end_col + 1

    -- Use 'nvim_buf_get_lines' to get the text.  Handles multi-line selections correctly.
    visual_selection = table.concat(vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false), "\n")

    -- Escape special characters *and* newlines.
    visual_selection = string.gsub(visual_selection, '"', '\\"')  -- Escape double quotes
    visual_selection = string.gsub(visual_selection, '`', '\\`')  -- Escape backticks
    visual_selection = string.gsub(visual_selection, '\n', '\\n') -- Escape newlines
  end

  -- Use vim.ui.input for an interactive prompt.
  vim.ui.input({
    prompt = "LLM Prompt (selected text will be appended): ",
    default = "",  -- Start with an empty prompt.  You could put a default prompt here.
    completion = nil, -- You can add file or other completion here if needed.
  }, function(user_input)
    -- Check if the user actually entered something.  Important to prevent errors.
    if user_input then
      -- Construct the full prompt.
      local full_prompt = user_input
      if visual_selection ~= "" then
        full_prompt = '"""' .. full_prompt .. ' <code>' .. visual_selection .. '</code>' .. '"""'
      end

      print("r !llm " .. full_prompt .. " 2>&1")
      -- Execute the LLM command.
      vim.api.nvim_command("new")
      vim.api.nvim_command("r !llm " .. full_prompt .. " 2>&1")
      vim.api.nvim_command("set syntax=markdown")
    else
      -- Optional: Handle the case where the user canceled the input.
      print("LLM command canceled.")
    end
  end)
end, {range = true, nargs = '*'})
