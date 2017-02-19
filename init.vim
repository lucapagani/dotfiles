" Plugin management stuff

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')

" Custom plugins...
" EasyMotion - Allows <leader><leader>(b|e) to jump to (b)eginning or (end)
" of words.
Plug 'easymotion/vim-easymotion'

" Ctrl-P - Fuzzy file search
Plug 'kien/ctrlp.vim'

" Neomake build tool (mapped below to <c-b>)
" Plug 'benekastah/neomake'

" Autocomplete for python
Plug 'davidhalter/jedi-vim', {'for': 'python'}

" Remove extraneous whitespace when edit mode is exited
Plug 'thirtythreeforty/lessspace.vim'

" " Deopete
" Plug 'Shougo/deoplete.nvim'
" " vim-clang
" Plug 'justmao945/vim-clang'

" Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
" YouCompleteMe generator
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" Color coded
" Plug 'jeaye/color_coded'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'arakashic/chromatica.nvim'

" Screen splitter.  Cool, but doesn't work with nvim.
"Plugin 'ervandew/screen'

" LaTeX editing
Plug 'lervag/vimtex', { 'for': 'tex' }
" Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': 'tex' }

" Status bar mods
Plug 'powerline/powerline'
Plug 'powerline/fonts'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'airblade/vim-gitgutter'

" Color scheme
Plug 'freeo/vim-kalisi'
" Plug 'morhetz/gruvboxp'
" Plug 'altercation/vim-colors-solarized'

" Tab completion
" Plug 'ervandew/supertab'

" Nerdcommenter
Plug 'scrooloose/nerdcommenter'

" Nerdtree
Plug 'scrooloose/nerdtree'

" Autopairs
Plug 'jiangmiao/auto-pairs'

" Doxygen
Plug 'vim-scripts/DoxygenToolkit.vim'

" ListToglle
Plug 'Valloric/ListToggle'

" cmake
" Plugin 'jalcine/cmake.vim'
Plug 'sigidagi/vim-cmake-project', { 'frozen': 1 }

" Thesaurus
Plug 'beloglazov/vim-online-thesaurus'

" R
Plug 'jalvesaq/Nvim-R', { 'for': 'r' }

" Autoformat
Plug 'Chiel92/vim-autoformat'

" Switch between header and source
" Plug 'vim-scripts/a.vim'

" After all plugins...
call plug#end()
filetype plugin indent on

" Map the leader key to SPACE
let mapleader="\<SPACE>"
let maplocalleader="\<SPACE>"

" Omnicomplete
set omnifunc=syntaxcomplete#Complete

""""""" Jedi-VIM """""""
" Don't mess up undo history
let g:jedi#show_call_signatures = "0"

""""""" SuperTab configuration """""""
" let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
" function! Completefunc(findstart, base)
    " return "\<c-x>\<c-p>"
" endfunction

" call SuperTabChain(Completefunc, '<c-n>')

" let g:SuperTabCompletionContexts = ['g:ContextText2']

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

autocmd FileType * setlocal formatoptions-=ro

syntax on
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
" set showmode            " Show current mode.
set noshowmode          " Don't show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set updatetime=500      " Set update time
set clipboard+=unnamed   " Unnamed register

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

set wildmode=longest,list,full " Autocompletion command line
set wildmenu

set foldmethod=indent   " Folding
set foldlevelstart=99

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Line break
set lbr

" Spell check on
set spell
set spelllang=en_gb
" Remove spell check in terminal
augroup terminal
  autocmd TermOpen * setlocal nospell
augroup END

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" Relative numbering
set rnu
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
" Move among buffers with CTRL
map <C-K> :bnext<CR>
map <C-J> :bprev<CR>

" Delete without copy
nnoremap d "_d
vnoremap d "_d
vnoremap p "_dP

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Terminal remap
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Remap windows navigation
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Airline
set laststatus=2
" let g:airline_powerline_fonts = 1                           " Use Powerline fonts to show beautiful symbols
let g:airline_inactive_collapse = 0                         " Do not collapse the status line while having multiple windows
let g:airline#extensions#whitespace#enabled = 0             " Do not check for whitespaces
let g:airline#extensions#tabline#enabled = 1                " Display tab bar with buffers
let g:airline#extensions#branch#enabled = 1                 " Enable Git client integration
let g:airline#extensions#tagbar#enabled = 1                 " Enable Tagbar integration
let g:airline#extensions#hunks#enabled = 1                  " Enable Git hunks integration
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
" let g:airline_theme= 'grcvbox'
let g:airline_theme= 'kalisi'
" let g:airline_theme= 'solarized'
" let g:bufferline_echo = 0

set background=dark
" colorscheme solarized
colorscheme kalisi
" colorscheme gruvbox

" Tex
let g:tex_flavor = 'latex'
" let g:vimtex_view_method = 'mupdf'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_latexmk_options = '-pdf -verbose -file-line-error -interaction=nonstopmode -synctex=1 -recorder-'
let g:vimtex_fold_enabled = 0
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_open_on_warning = 1
let g:vimtex_toc_resize = 0

if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
  \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
  \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
  \ 're!\\hyperref\[[^]]*',
  \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
  \ 're!\\(include(only)?|input){[^}]*',
  \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
  \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
  \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
  \ ]

" let g:tex_flavor = 'latex'
" " let g:LatexBox_latexmk_async = 1
" let g:LatexBox_latexmk_preview_continuously = 1
" let g:LatexBox_quickfix = 2
" let g:LatexBox_viewer = "okular --unique"
" " let g:LatexBox_latexmk_options = "-recorder-"
" let g:LatexBox_latexmk_options = '-pdf -verbose -file-line-error -interaction=nonstopmode -synctex=1 -recorder-'

" YouComopleteMe
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_auto_trigger = 0
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_allow_changing_updatetime = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_filepath_completition_use_working_dir = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<TAB>'
let g:ycm_complete_in_strings = 1

nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>

" Deopete
let g:deoplete#enable_at_startup = 1
" vim-clang
let g:clang_library_path='/usr/lib/'
let g:clang_compilation_database = './build'
let g:clang_c_options = ''
let g:clang_cpp_options = '-std=c++11'
let g:clang_include_sysheaders = 1

" Add space gutter
sign define dummy
execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" Nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Lists toggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" R
" let R_vsplit = 1
let R_nvimpager = 'vertical'
let R_assign = 0

" Autoformat
noremap <F3> :Autoformat<CR>

let b:formatdef_custom_cpp='"astyle --mode=c -A14 --indent=spaces=2"'
let b:formatters_cpp = ['custom_cpp']

let b:formatdef_custom_c='"astyle --mode=c -A14 --indent=spaces=2"'
let b:formatters_c = ['custom_c']

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" Autoformat
let b:formatdef_custom_c='"astyle"'
let b:formatters_c = ['custom_c']
let b:formatdef_custom_cpp = '"astyle"'
let b:formatters_cpp = ['custom_cpp']

" C++ color
" let g:cpp_class_scope_highlight = 1
" let g:cpp_experimental_template_highlight = 1
" let g:cpp_concepts_highlight = 1

" Chromatica
let g:chromatica#libclang_path='/usr/lib/'
let g:chromatica#enable_at_startup=1
let g:chromatica#highlight_feature_level=2
let g:chromatica#responsive_mode=1

