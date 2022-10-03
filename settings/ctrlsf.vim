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
