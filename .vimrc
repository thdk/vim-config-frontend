" source: 
" - https://github.com/neoclide/coc.nvim#example-vim-configuration

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649:
set nobackup
set nowritebackup

" Disable swp files
set noswapfile

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Folding
set foldmethod=syntax "syntax highlighting items specify folds  
set foldcolumn=1 "defines 1 col at window left, to indicate folding  
let javaScript_fold=1 "activate folding by JS syntax  
set foldlevelstart=99 "start file with all folds opened

" don't include the character below the cursor in visual mode
:set selection=exclusive

" Use the system clipboard 

" CTRL-X is Cut
vnoremap <C-X> "+x

" CTRL-C is Copy
vnoremap <C-C> "+y

" CTRL-V is Paste
map <C-V>       "+gP
cmap <C-V>      <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>       <C-V>

" Change leader key to ','
let mapleader=","

" Custom key maps
" ctrl + w isn't an easy key combo to manage open windows => allow leader + w
:nnoremap <Leader>w <C-w>

" open recent file list
nmap <Leader>m :browse oldfiles<CR>

" This will cause all splits to happen below (including terminal).
set splitbelow
set termwinsize=10x0

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Edit

" Allow backspace to remove indents, newlines and old text
set backspace=indent,eol,start

" toggle paste mode
set pastetoggle=<leader>p

" Add '-' as recognized word symbol. e.g dw delete all 'foo-bar' instead just 'foo'
set iskeyword+=-

" source:
" - https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
set number
set relativenumber

" decrease performace in favor of correct syntax highlighing 
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Plugins

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'

Plug 'tomasiser/vim-code-dark'

Plug 'pangloss/vim-javascript'

Plug 'leafgarland/typescript-vim'

Plug 'peitalin/vim-jsx-typescript'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'kevinoid/vim-jsonc'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'

Plug 'Raimondi/delimitMate'

Plug 'alvan/vim-closetag'

Plug 'yegappan/mru' " recent file list (or just use native :browse oldfiles command)

Plug 'mg979/vim-visual-multi'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting
  
  " list all files in current working dir
  " hint: press C on a folder in NERDTree to set is as working dir
  nnoremap <silent> <leader><space> :Files<CR>

  " git ls-files
  nnoremap <silent> <leader>gf :GFiles<CR>
  " git status
  nnoremap <silent> <leader>gs :GFiles?<CR>
  " git commits
  nnoremap <silent> <leader>gl :Commits<CR>

  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>A :Windows<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>o :BTags<CR>
  nnoremap <silent> <leader>O :Tags<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>
  nnoremap <silent> <leader>ft :Filetypes<CR>

  imap <C-x><C-l> <plug>(fzf-complete-line)
" }}}

let g:coc_global_extensions = ['coc-tsserver']

" conditionally install eslint and prettier plugins based on whether or not those tools are installed in the local node_modules folder
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Initialize plugin system
call plug#end()

"
" colors
colorscheme codedark
let g:airline_theme = 'codedark'

:hi TabLineSel ctermfg=0 ctermbg=118

"-------------------------
" CoC

nmap <silent> cd <Plug>(coc-definition)      " Go to definition
nmap <silent> cf <Plug>(coc-references)      " Find all references
nmap <silent> ct <Plug>(coc-type-definition) " Show type
nmap <silent> ci <Plug>(coc-implementation)  " Go to implementation

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `<leader>[` and `<leader>]` to navigate diagnostics
nmap <silent> <leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>] <Plug>(coc-diagnostic-next)

" Use `<leader>a[` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>a[ :CocDiagnostics<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!

  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

augroup end

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Open code actions
nmap <leader>ca <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"-------------------------
" NERDTree
" show dotfiles (ex .eslintrc) by default
let NERDTreeShowHidden=1
"
" show current file in NERDTree
map <leader>f :NERDTreeFind<cr>

" set the current working dir when opening a file/folder from NERDTree
let g:NERDTreeChDirMode = 2

"-------------------------
" Fugitive

" Blame on current line or all selected lines in visual mode
map <silent> <leader>b :G blame<cr>
" Git status
nmap <silent> <leader>gst :G<cr>
" like git add
nmap <silent> <leader>gw :Gwrite<cr>
" git diff
nmap <silent> <leader>gd :G diff<cr>
" git commit
nmap <silent> <leader>gc :G commit<cr>
" git commit all
nmap <silent> <leader>gca :G commit -a<cr>
" git fixup previous commit
nmap <silent> <leader>gcf :G commit -a --amend<cr>

"-------------------------
" DelimitMate

" Delimitmate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last
let delimitMate_expand_cr = 1

" Delimitmate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of { x}
let delimitMate_expand_space = 1

" Enable it for quotes
let delimitMate_smart_quotes = 1

"-------------------------
" vim-closetag

" Enable for files with this extensions
let g:closetag_filenames = "*.handlebars,*.html,*.xhtml,*.phtml,*.tsx,*jsx"

"-------------------------
" airline

" toggle airline tabline on/off
let g:airline#extensions#tabline#enabled = 0

" tabline formatter (default | jsformatter | unique_tail |
" unique_tail_improved)
let g:airline#extensions#tabline#formatter = 'jsformatter'

