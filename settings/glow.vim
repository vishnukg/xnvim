"====================== Glow Lua config Settings======================
nmap <silent> <leader>md :Glow<CR>

lua <<EOF
require('glow').setup({
  style = "dark",
  width = 140,
})
EOF

