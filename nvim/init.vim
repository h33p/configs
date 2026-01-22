call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lsp'
Plug 'ncm2/float-preview.nvim'
Plug 'neovim/nvim-lspconfig'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/deoplete-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind-nvim'
" Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'Yggdroot/indentLine'
Plug 'zivyangll/git-blame.vim'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'mattn/webapi-vim'
Plug 'mikelue/vim-maven-plugin'
Plug 'tikhomirov/vim-glsl'
Plug 'tpope/vim-surround'
Plug 'DingDean/wgsl.vim'
Plug 'ziglang/zig.vim'
Plug 'gyim/vim-boxdraw'
Plug 'inkarkat/vim-unconditionalpaste'
Plug 'olimorris/codecompanion.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'junegunn/vim-cfr'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" LSP end
call plug#end()

let g:lightline = {
\   'colorscheme': 'onedark',
\   'active': {
\     'left':[ [ 'mode', 'paste' ],
\              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
\     ],
\     'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
\   },
\   'component': {
\     'lineinfo': '%3l:%-2v'
\   },
\   'component_function': {
\     'gitbranch': 'fugitive#head',
\   }
\ }
let g:lightline.separator = {
\   'left': "\ue0b0", 'right': "\ue0b2"
\}
let g:lightline.subseparator = g:lightline.separator

let g:lightline.tabline = {
\   'left': [ ['tabs'] ],
\   'right': [ ['close'] ]
\ }

" 'cocstatus',
" \     'cocstatus': 'coc#status',

" Colour scheme
syntax on
colorscheme onedark

highlight CursorLine ctermbg=234
highlight CursorLineNr ctermfg=39 ctermbg=234
highlight LineNr ctermbg=234
highlight SyntasticWarningSign ctermfg=173

" Indent lines
let g:indentLine_setColors = 1
let g:indentLine_color_term=239
let g:indentLine_char = '▏'
let g:indentLine_concealcursor = ''

" Some lightline options
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
set laststatus=2
set noshowmode

set signcolumn=yes

" Toggle relative line numbers with the current line displayed absolutely
set number relativenumber

" Highlight current line
set cursorline

" lua config
lua require'init'

" rust.vim
filetype plugin indent on

" nvim-lsp

" setup rust_analyzer LSP (IDE features)
lua require'lsp'

" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Enable deoplete autocompletion in Rust files
" let g:deoplete#enable_at_startup = 1

set completeopt-=preview
let g:float_preview#docked = 0

" customise deoplete
" maximum candidate window length
" call deoplete#custom#source('_', 'max_menu_width', 80)

" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"

" Autopairs
let g:AutoPairsShortcutFastWrap = '<C-e>'
let g:AutoPairsShortcutBackInsert = '<C-b>'
let g:AutoPairsFlyMode = 0

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeWinPos = "right"
let NERDTreeCustomOpenArgs = {'file':{'where':'t'}}

" Other Keybindings
nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>
nnoremap <C-_> :nohl<CR>
nnoremap Q :e#<CR>

nnoremap <F12> :call ToggleColumns()<CR>
if has("patch-8.1.1564") || has('nvim')
	set signcolumn=number
else
	function! ToggleColumns()
		if &signcolumn == 'no'
			set signcolumn=yes
		else
			set signcolumn=no
		endif
	endfunction
endif

" Git lens
lua vim.api.nvim_command [[autocmd CursorHold * lua require'utils'.blameVirtText()]]
lua vim.api.nvim_command [[autocmd CursorMoved * lua require'utils'.clearBlameVirtText()]]
lua vim.api.nvim_command [[autocmd CursorMovedI * lua require'utils'.clearBlameVirtText()]]

" Misc.
set updatetime=60

" Default language settings
set tabstop=4
set shiftwidth=4
set expandtab

" Language specific options
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascriptreact setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype typescriptreact setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype typescript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype java setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype terraform setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype hcl setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype nix setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Disable mouse
set mouse=

" Some LaTeX thing
let g:Imap_FreezeImap=1

