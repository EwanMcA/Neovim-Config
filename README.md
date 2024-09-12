# Neovim-Config

# Cheat Sheet - Generic

## Normal Mode
vis to select inner sentence, then o to jump between ends

## Visual Mode
o   |    jump between ends of selection

# Cheat Sheet - My stuff

## Insert Mode
jk, leave insert    |    kk, leave insert     |    jj leave insert

## Normal Mode
<leader>cs        |    open this file 
<leader>ev        |    open init.vim
<leader>sv        |    source init.vim
E                 |    open file explorer

-- misc
J                 |    mzJ`z
<leader>n         |    remove highlights
<leader>;         |    toggle line nos
<leader>y         |    copy and put on clipboard

-- search
<leader><c-f>     |    Ag search
<c-f>             |    Ag search word under cursor

-- Buffers
<leader>f         |    <cmd>lua ChangeBuffer(true)<CR>
<leader>b         |    <cmd>lua ChangeBuffer(false)<CR>
<leader>d         |    :bp|bd #<CR>
<leader>g         |    :b#<CR>
<leader>G         |    :bm<CR>
<leader>1         |    :b1<CR>
<leader>2         |    :b2<CR>
...

-- FZF
<leader>l         |    <cmd>Buffers<CR>
<c-p>             |    <cmd>GFiles<CR>
<leader>p         |    <cmd>FZF<CR>

-- Git
<leader><leader>g |    <cmd>GBrowse<CR>

-- Tests
<F2>              |    test current file

-- Terminal
-- (t, <Esc>, <C-\\><C-n> CLASH WITH CHANGE TAB


## Visual Mode
J    |    :m '>+1<CR>gv=gv
K    |    :m '<-2<CR>gv=gv

## Commands
Pdb  |    debug at cursor
GB   |    Git blame
