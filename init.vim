"======================Vim Plug Settings======================
" Specify a directory for plugins
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'mattn/emmet-vim'
Plug 'jacoborus/tender.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'rust-lang/rust.vim'
Plug 'uiiaoo/java-syntax.vim'
Plug 'vim-test/vim-test'
Plug 'gruvbox-community/gruvbox'
Plug 'sheerun/vim-polyglot'

" Initialize plugin system
call plug#end()

"======================General Settings======================
syntax enable
filetype plugin indent on
" Use new regular expression engine
set re=0

"If you have vim >=8.0 or Neovim >= 0.1.5
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set t_Co=256
set t_ut=
set background=dark
colorscheme codedark

" Highlighting cursorline
set cursorline
"hi CursorLine cterm=None ctermbg=234 ctermfg=None
" use the below settings for a dark theme

"hi cursorline cterm=none term=none
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline
" highlight CursorLine ctermfg=NONE gui=none ctermbg=none

""highlight parantheses
highlight MatchParen term=underline cterm=underline gui=underline

"highlight selected text
highlight Visual ctermfg=NONE gui=none ctermbg=240

" Transparent background vim
autocmd vimenter * hi Normal guifg=NONE guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guifg=NONE guibg=NONE ctermbg=NONE

" Disable highlighting vertical split
hi VertSplit ctermbg=black ctermfg=black

"Remove highlight from number line & sign column (git gutter)
hi clear LineNr
hi clear SignColumn

"Transparent status line
hi StatusLine ctermbg=0 cterm=NONE

"Remove tilde character for empty lines
highlight EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

if has('nvim')
" Remove tilde character
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾
" Nvim no line number terminal
autocmd TermOpen * setlocal nonumber norelativenumber
"autocmd BufWinEnter,WinEnter term://* startinsert	
end

set cmdheight=1


"======================COC NVIM settings======================
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
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

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>





"======================NerdTree settings======================

"Show Hidden files in nerdtree
let NERDTreeShowHidden=1

"Automatically delete the buffer of the file you just deleted with NERDTree
let NERDTreeAutoDeleteBuffer = 1

"Making NERDTree prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" NERDTree width
let g:NERDTreeWinSize = 34 

" Automatically close NERDTree buffer when we open a new file
let NERDTreeQuitOnOpen=1

" Map nerdtree toggle
nnoremap <C-g> :NERDTreeToggle<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


"=================Vim Go settings======================
" go-vim plugin specific commands
" disable all linters as that is taken care by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" Also run `goimports` on your current file on every save
" Might be be slow on large codebases, if so, just comment it out

let g:go_fmt_command = "goimports"

" Status line types/signatures.
let g:go_auto_type_info = 1

"Go syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" If you want to disable gofmt on save
" let g:go_fmt_autosave = 0
" let g:go_rename_command = 'gopls'

" Switching off go to def for vim go
let g:go_def_mapping_enabled = 0

autocmd FileType go nmap <leader>gr <Plug>(go-run)
autocmd FileType go nmap <leader>gb <Plug>(go-build)
autocmd FileType go nmap <leader>gc <Plug>(go-coverage)

autocmd FileType go nmap <leader>gt <Plug>(go-test)
autocmd FileType go nmap <leader>gtf <Plug>(go-test-func)
autocmd FileType go nmap <leader>gtc <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>gi <Plug>(go-info)

"======================Keys Mapping settings======================
" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys " for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
"inoremap <Left>  <ESC>:echoe "Use h"<CR>
"inoremap <Right> <ESC>:echoe "Use l"<CR>
"inoremap <Up>    <ESC>:echoe "Use k"<CR>
"inoremap <Down>  <ESC>:echoe "Use j"<CR>
"
"--- For saving documents
":nmap <c-s> :w<CR>
":imap <c-s> <Esc>:w<CR>a
"--- End saving documents


" Remapping jj as esc key
inoremap jk <ESC>
inoremap kj <ESC>

"-----Shortcut for saving all changed files
:map <leader><leader> :wa<cr>



"-----Shortcut for opening terminal on the right vertically
noremap <leader>tr :botright vertical terminal<CR>

"-----Shortcut for opening terminal on the bottom
noremap <leader>tb :below terminal<CR>

if has('nvim')
		nnoremap <leader>tr :vsplit term://zsh<CR><C-W><C-R>
		nnoremap <leader>tb :split term://zsh<CR><C-W><C-R>
end


"au filetype go inoremap <buffer> . .<C-x><C-o>
" ts - show existing tab with 4 spaces width
" sw - when indenting with '>', use 4 spaces width
" sts - control <tab> and <bs> keys to match tabstop

" Highlight search
set hls

"This unsets the "last search pattern register by hitting return
nnoremap <C-L> :noh<CR><C-L>

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Disable vi compatability
set nocompatible

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowritebackup
set nowb

" Show line number
set number

" Set relative number
set relativenumber

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Control all other files
set shiftwidth=4

"set undofile " Maintain undo history between sessions
"set undodir=~/.vim/undodir

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.

set autoread  "Reload files changed outside vim  

" Automatic reloading of .vimrc
"autocmd! bufwritepost .vimrc source %

set showmatch	  	"Highlights matching brackets in programming languages


"====================== Airline status bar settings======================
"set airline theme
let g:airline_theme = 'deus'
" air-line plugin specific commands
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


"====================== FZF Settings======================
nnoremap <C-s> :GFiles<Cr>

"Terminal Layout
"let g:fzf_layout = { 'down': '40%' }

"Popup Layout
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Visual'],
  \ 'fg+':     ['fg', 'Visual'],
  \ 'bg+':     ['bg', 'Visual'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"Prevent FZF opening files in nerd tree buffer
au BufEnter * if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree' && winnr('$') > 1 | b# | exe "normal! \<c-w>\<c-w>" | :blast | endif



"====================== CTRLSF Settings======================
nmap <leader>f <Plug>CtrlSFPrompt
nmap <leader>fw <Plug>CtrlSFCwordPath -W<CR>

let g:ctrlsf_auto_preview = 1
let g:ctrlsf_auto_close = 0
let g:ctrlsf_confirm_save = 0
let g:ctrlsf_auto_focus = {
    \ 'at': 'start',
    \ }
let g:ctrlsf_search_mode = 'async'

" Substitute the word under the cursor.
nmap <leader>cw :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>



"====================== VIM Test Settings======================
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>


"====================== Rust Language Settings======================
let g:rustfmt_autosave = 1
