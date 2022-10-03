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

