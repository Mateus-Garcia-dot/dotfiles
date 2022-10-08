"
"  _   _                      _
" | \ | |                    (_)
" |  \| |  ___   ___  __   __ _  _ __ ___
" | . ` | / _ \ / _ \ \ \ / /| || '_ ` _ \
" | |\  ||  __/| (_) | \ V / | || | | | | |
" \_| \_/ \___| \___/   \_/  |_||_| |_| |_|
"
" By: Me

set nocompatible              
filetype plugin on                  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
" Plug 'dense-analysis/ale'
Plug 'Mofiqul/dracula.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'Raimondi/delimitMate'
Plug 'puremourning/vimspector'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smarttab
set shiftwidth=2                
set tabstop=2
set expandtab
set number relativenumber     
set termguicolors
syntax on
set mouse=a
set clipboard=unnamedplus
let mapleader = "\\"

" treat all files as jdoc
augroup JsonToJsonc
	autocmd! FileType json set filetype=jsonc
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to ii
:imap ii <Esc>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>qf  <Plug>(coc-fix-current)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => debug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimspector_base_dir='/home/mateus/.vim/plugged/vimspector'
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nmap <leader>vl :call vimspector#Launch()<CR>
nmap <leader>vr :VimspectorReset<CR>
nmap <leader>ve :VimspectorEval
nmap <leader>vw :VimspectorWatch
nmap <leader>vo :VimspectorShowOutput
nmap <leader>vc :call vimspector#ClearBreakpoints()
nmap <leader>vi <Plug>VimspectorBalloonEval
xmap <leader>vi <Plug>VimspectorBalloonEvallet 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
actions = {	
	open_file = {
		quit_on_open = true
	}
	},
	git = {
  enable = true,
  ignore = false,
  timeout = 500,
}
})

EOF

map <C-n> :NvimTreeFocus<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indent lines
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << END
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}
END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move to previous/next
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme dracula

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lualine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << END
require('lualine').setup {
  options = { theme  = 'dracula' },
}
END

