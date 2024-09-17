# Neovim-Config

# Cheat Sheet - Generic

## Normal Mode
vis to select inner sentence, then o to jump between ends

## Visual Mode
|trigger | description                   |
|--------|-------------------------------|
| o      |jump between ends of selection |

# Cheat Sheet - My stuff

## Insert Mode
jk, leave insert    |    kk, leave insert     |    jj leave insert

## Normal Mode
|trigger          | description                         |
|-----------------|-------------------------------------|
`<leader>`cs      |    open this file 
`<leader>`ev      |    open init.vim
`<leader>`sv      |    source init.vim
E                 |    open file explorer

### Misc
|trigger          | description                         |
|-----------------|-------------------------------------|
|J                |    mzJ`z|
|`<leader>`n      |    remove highlights|
|`<leader>`;      |    toggle line nos|
|`<leader>`y      |    copy and put on clipboard|

### Search
|trigger          | description                         |
|-----------------|-------------------------------------|
|`<leader><c-f>`  |    Ag search
|`<c-f>`          |    Ag search word under cursor

### Buffers
|trigger          | description                         |
|-----------------|-------------------------------------|
|`<leader>`f      |    <cmd>lua ChangeBuffer(true)<CR>
|`<leader>`b      |    <cmd>lua ChangeBuffer(false)<CR>
|`<leader>`d      |    :bp|bd #<CR>
|`<leader>`g      |    :b#<CR>
|`<leader>`G      |    :bm<CR>
|`<leader>`1      |    :b1<CR>
|`<leader>`2      |    :b2<CR>


### FZF
|trigger          | description                         |
|-----------------|-------------------------------------|
|`<leader>`l       |  <cmd>Buffers<CR>
|`<c-p>`           |  <cmd>GFiles<CR>
|`<leader>`p       |  <cmd>FZF<CR>

### Git
|trigger          | description                         |
|-----------------|-------------------------------------|
|`<leader>``<leader>`g |    <cmd>GBrowse<CR>

### Tests
|trigger          | description                         |
|-----------------|-------------------------------------|
|`<F2>`           |    test current file

## Visual Mode
|trigger          | description                         |
|-----------------|-------------------------------------|
|J                |    shift line down
|K                |    shift line up

## Commands
|trigger          | description                         |
|-----------------|-------------------------------------|
|Pdb              |    debug at cursor
