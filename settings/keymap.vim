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
