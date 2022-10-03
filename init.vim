source $HOME/.config/nvim/settings/vimplug.vim
source $HOME/.config/nvim/settings/coc.vim
source $HOME/.config/nvim/settings/nerdtree.vim
source $HOME/.config/nvim/settings/airline.vim
source $HOME/.config/nvim/settings/ctrlsf.vim
source $HOME/.config/nvim/settings/fzf.vim
source $HOME/.config/nvim/settings/keymap.vim
source $HOME/.config/nvim/settings/keyopts.vim
source $HOME/.config/nvim/settings/test.vim
source $HOME/.config/nvim/settings/go.vim
source $HOME/.config/nvim/settings/rust.vim
source $HOME/.config/nvim/settings/glow.vim


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
