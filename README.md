# Vim config for frontend development

Inspired by [this vim config]( https://github.com/L0stSoul/vim-config) but started from scratch again and 
evaluated each plugin again to see if alternatives exist.

Some parts of the README and the .vimrc file have been copied from there and might not be working here yet.
Either intentional, so the README should be updated, or not, so the .vimrc file should be updated.

## Syntax support

* Javascript / Typescript
* JSX / TSX
* Markdown

## Features

### ESlint

### Prettier

### Folding

Use `Space` key to toggle code folding.

Other native vim key maps for folding are:

* za - toggle fold
* zc - close the fold (where your cursor is positioned)
* zM - close all folds on current buffer
* zo - open the fold (where your cursor is positioned)
* zR - open all folds on current buffer
* zj - cursor is moved to next fold
* zk - cursor is moved to previous fold

more fold commands: `:help folding`

### Comments ([commentary](https://github.com/tpope/vim-commentary))

`gcc` toggles a line in normal mode

`gc` toggles selected lines in visual mode

### Autocompletion ([coc](https://github.com/neoclide/coc.nvim))

CoC configuration: (open this file in vim with `:CocConfig`)

```json
{
  "eslint.autoFixOnSave": true,
  "coc.preferences.formatOnSaveFiletypes": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact"
  ],
  "tsserver.formatOnType": true,
  "coc.preferences.formatOnType": true
}
```

### Multi cursor ([vim-visual-multi](https://github.com/mg979/vim-visual-multi))

ctrl-up | ctrl-down to insert multiple cursors

#### Git integration ([Fugitive](https://github.com/tpope/vim-fugitive))

Allows to simply use `:G` in vim instead of `git` for git CLI commands.

`:G status`

Action | Hotkey
--------------------------------------------------------- | -----------------
Git blame on the current line or all selected line        | `leader b`
Git status                                                | `leader gst`
Git add/checkout file                                     | `leader gw`
Git diff                                                  | `leader gd`
Git commit                                                | `leader gc`
Git commit all                                            | `leader gca`
Git commit -a --amend                                     | `leader gcf`

### Auto close brackets and quotes ([DelimitMate](https://github.com/Raimondi/delimitMate))

### Surround ([surround](https://github.com/tpope/vim-surround))

Provides keystrokes to easily delete, change and add such surroundings in pairs.

__Normal mode__

`csAB`  change surroundingsfrom A to B for this line
 
`dsA`   delete surrounding A for this entire line
  
`yssb`  wrap line with parentheses ( line ) 
  
`ysiwA` wrap word(textblock) with surrounding A 
  
__Visual mode__ 
 
Select lines using `V` now type `S` and write the desired surrounding start 

`S<div class='container'>`

## Interface

### Improved status and tab bar ([Airline](https://github.com/bling/vim-airline))

### File navigation tree ([NERDTree](https://github.com/preservim/nerdtree))

### Fuzzy search

```shell
nnoremap <leader><space> :Files<CR>
nnoremap <leader>a :Buffers<CR>
nnoremap <leader>A :Windows<CR>
nnoremap <leader>; :BLines<CR>
nnoremap <leader>o :BTags<CR>
nnoremap <leader>O :Tags<CR>
nnoremap <leader>? :History<CR>
nnoremap <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <leader>. :AgIn
nnoremap K :call SearchWordWithAg()<CR>
vnoremap K :call SearchVisualSelectionWithAg()<CR>
nnoremap <leader>gl :Commits<CR>
nnoremap <leader>ga :BCommits<CR>
nnoremap <leader>ft :Filetypes<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)
```

## Hotkeys

Note: the `leader` key set with this .vimrc file is ',' (comma)

Action | Hotkey
--------------------------------------------------------- | -----------------
**▶ File operations**                                     |
Recent Files List                                         | `leader m`
Show current file in NERDtre                              | `leader f`
**▶ Coding features**                                     |
Go to type definition/declaration                         | `leader cd`
Find all references of variable under coursor             | `leader cf`
Show type of variable under cursor                        | `leader ct`
Show docs for entity under cursor                         | `leader cd`
Smart rename an entity under coursor and all refs to it   | `leader cr`
**▶ Code completion**                                     |
Next completion item                                      | `tab`
Previous completion item                                  | `shift+tab`
Undo autocompletion                                       | `ctrl+e`
Expand snippet                                            | `Enter`
**▶ Splits**                                              |
Move between splits                                       | `leader w`
Move to the top split                                     | `shift + arrow up`
Move to the bottom split                                  | `shift + arrow down`
Move to the the right split                               | `shift + arrow right`
Move to the the left split                                | `shift + arrow left`
Make split bigger vertically                              | `shift + ctrl + arrow up`
Make split smaller vertically                             | `shift + ctrl + arrow down`
Make split bigger horizontally                            | `shift + ctrl + arrow right`
Make split smaller horizontally                           | `shift + ctrl + arrow left`

## Color scheme

vscode like dark

## Easy installation

You just need to place `.vimrc` in your home directory and install plugins:

```shell
:PlugInstall
```

**pro tip: keep your `.vimrc` file up to date with this repo**

Clone the repo, and place symlink to .vimrc in your home directory. E.g.:

```bash
 git clone https://github.com/thdk/vim-config-frontend.git && ln -rsf ./vim-config-frontend/.vimrc ~/.vimrc
```

