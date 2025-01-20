syntax on
filetype plugin indent on
set mouse=vr
set t_Co=256
set encoding=UTF-8
set wildoptions=
set backspace=indent,eol,start
set hidden
"set showtabline=2
set noshowmode
highlight clear SignColumn

" Disable copilot
"let g:copilot_enabled = v:false

" JavaScript
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
autocmd FileType javascript,typescript setlocal ts=2 sts=2 sw=2 expandtab
au BufNewFile,BufRead *.mjs set filetype=javascript

call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ryanoasis/vim-devicons'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'liuchengxu/vista.vim'
Plug 'dense-analysis/ale'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/tokyonight.nvim'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'mhinz/vim-signify'
"Plug 'wfxr/minimap.vim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'github/copilot.vim'
"Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
Plug 'IngoMeyer441/coc_current_word'
Plug 'voldikss/vim-floaterm'
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
"
"" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"" On-demand loading
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"" Using a non-default branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
"" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"
"" Plugin options
"Plug 'nsf/gocode', {'rtp': 'nvim/' }
"Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
"
"" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
call plug#end()

"let g:deoplete#enable_at_startup = 1
"

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline_theme='papercolor'
let g:airline_theme='base16_ashes'
let g:airline_detect_modified = 1
"let g:airline_theme='supernova'
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1

" Floaterm
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_title = 'term'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9


set background=dark
"colorscheme tokyonight-storm
colorscheme tokyonight-moon
"colorscheme PaperColor
"colorscheme darkblue

" PaperColor
"let g:PaperColor_Theme_Options = {
"  \    'theme': {
"  \      'default.dark': {
"  \        'transparent_background': 1
"  \      }
"  \    }
"  \  }

" Remove backgrounds from themes to allow for transparency
hi Normal guibg=NONE ctermbg=NONE
"hi NormalFloat guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi NormalSB guibg=NONE ctermbg=NONE
hi TelescopeNormal guibg=NONE ctermbg=NONE



" Signify
highlight clear SignColumn
highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
highlight Pmenu ctermfg=7 ctermbg=54 guifg=#ffffff guibg=#000000

" golang syntax highlighting
let g:go_doc_popup_window = 1
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_fmt_command = "gofumpt"

" YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

" JSON
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
au BufNewFile,BufRead *.jsonc set filetype=json

" Terraform
au Filetype terraform setl ts=2 sts=2 sw=2 expandtab

" Highlights
hi clear spellbad
hi spellbad cterm=undercurl

" NERD_tree config
let NERDTreeShowHidden=1
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F2> :NERDTreeToggle<CR>

" Vista toggle
"nmap <F8> :Vista!!<CR>

" ALE
map <F10> :ALEToggle<CR>
let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['golines', 'gofumpt', 'goimports'],
"\   'json': ['prettier'],
"\   'typescript': ['deno', 'eslint'],
"\   'javascript': ['prettier', 'eslint'],
"\   'markup': ['prettier'],
"\   'terraform': ['terraform'],
\}
"
"let g:ale_linters = {
""\  'typescript': ['deno', 'eslint'],
"\  'typescript': ['eslint'],
"\  'javascript': ['prettier', 'eslint'],
"\  }
let g:ale_linters_ignore = {'typescript': ['tslint']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0

let g:ale_echo_msg_error_str = 'ErroR'
let g:ale_echo_msg_warning_str = 'WarninG'

" minimap
let g:minimap_width = 7
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
let g:minimap_git_colors = 1

map <F3> :MinimapToggle<CR>

highlight minimapCursor ctermbg=NONE ctermfg=227 guibg=NONE guifg=NONE
"hi MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=NONE
hi MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=#32302f
let g:minimap_cursor_color = 'MinimapCurrentLine'

" CoC
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use " to show documentation in preview window
nnoremap <silent> " :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('"', 'in')
  endif
endfunction

" Enable highlight current symbol con `CursorHold`
autocmd CursorHold * silent call CocActionAsync('highlight')

" End of CoC


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif"`'")"'")


" LUA
lua require("toggleterm").setup()
lua require('config/treesitter')
lua require("config/set")
lua require("config/remap")
"lua require("config/tabnine")
lua << EOF
require("nvim-autopairs").setup {}
EOF

" Telescope
lua require("config/telescope")

"lua require('config/tokyonight')
