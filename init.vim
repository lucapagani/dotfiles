" Plugin management stuff

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')

" Custom plugins...
" EasyMotion - Allows <leader><leader>(b|e) to jump to (b)eginning or (end)
" of words.
Plug 'easymotion/vim-easymotion'
" Ctrl-P - Fuzzy file search
Plug 'kien/ctrlp.vim'
" Autocomplete for python
" Plug 'davidhalter/jedi-vim', {'for': 'python'}
" Remove extraneous whitespace when edit mode is exited
" Plug 'thirtythreeforty/lessspace.vim'
" Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer  --system-libclang' }
" Plug 'zchee/deoplete-clang', { 'for': 'tex' }
" YouCompleteMe generator
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" Color coded
" Plug 'jeaye/color_coded'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'arakashic/chromatica.nvim'
" LaTeX editing
Plug 'lervag/vimtex', { 'for': 'tex' }
" Status bar mods
" Plug 'powerline/powerline'
" Plug 'powerline/fonts'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Color scheme
Plug 'freeo/vim-kalisi'
" Nerdcommenter
Plug 'scrooloose/nerdcommenter'
" Nerdtree
Plug 'scrooloose/nerdtree'
" " Autopairs
" Plug 'jiangmiao/auto-pairs'
" DeliMate
Plug 'Raimondi/delimitMate'
" Doxygen
Plug 'vim-scripts/DoxygenToolkit.vim'
" ListToglle
Plug 'Valloric/ListToggle'
" cmake
" Plug 'jalcine/cmake.vim'
Plug 'sigidagi/vim-cmake-project', { 'frozen': 1 }
" Thesaurus
Plug 'beloglazov/vim-online-thesaurus'
" R
Plug 'jalvesaq/Nvim-R', { 'for': 'r' }
Plug 'roxma/nvim-completion-manager', { 'for': 'r' }
Plug 'gaalcaras/ncm-R', { 'for': 'r' }
" R linter
" Plug 'w0rp/ale', { 'for': ['r', 'tex'] }
Plug 'w0rp/ale', { 'for': ['r'] }
" Autoformat
" Plug 'Chiel92/vim-autoformat'
" Neoformat
Plug 'sbdchd/neoformat'
" Close buffers
Plug 'qpkorr/vim-bufkill'
" Utilsnips
Plug 'SirVer/ultisnips'
" " Neosnippet
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Denite
Plug 'Shougo/denite.nvim'
" Debug
Plug 'critiqjo/lldb.nvim'
" " Tslime
" Plug 'jgdavey/tslime.vim'
" Vimux
Plug 'benmills/vimux'
" Vim-slime
Plug 'jpalardy/vim-slime'
" Semantic highlight
Plug 'jaxbot/semantic-highlight.vim'
" Flake8
Plug 'nvie/vim-flake8'
" BufOnly
Plug 'vim-scripts/BufOnly.vim', { 'frozen': 1 }
" Dash
Plug 'rizzatti/dash.vim'
" Autoreload
Plug 'TheZoq2/neovim-auto-autoread'
" Tagbar
Plug 'majutsushi/tagbar'
" " A
" Plug 'vim-scripts/a.vim'
" Vim-repeat
Plug 'tpope/vim-repeat'
" Cosco.vim
Plug 'lfilho/cosco.vim'

" After all plugins...
call plug#end()

" Map the leader key to SPACE
let mapleader="\<SPACE>"
let maplocalleader="\<SPACE>"

" Map : to ;
noremap ; :
noremap : ;

" Omnicomplete
set omnifunc=syntaxcomplete#Complete

""""""" Jedi-VIM """""""
" Don't mess up undo history
let g:jedi#show_call_signatures = "0"

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" autocmd FileType * setlocal formatoptions-=ro
" au FileType c,cpp setlocal comments-=:// comments+=f://
setlocal formatoptions-=c formatoptions-=r formatoptions-=o

syntax on
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
" set noshowmode          " Don't show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set updatetime=500      " Set update time
" set ttimeoutlen=50      " Set timeout space
set clipboard+=unnamed   " Unnamed register
set mouse=a             " Enable mouse
set hid
au CursorHold * checktime
" set guicursor=

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
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
set spelllang=en_us
" Remove spell check in terminal
augroup terminal
  autocmd TermOpen * setlocal nospell
augroup END

" Set .h c++ files
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c,*.hpp,*.cpp,*.hxx,*.cxx,*.hh,*.cc set filetype=cpp.doxygen
augroup END

" Search and Replace
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//<Left>

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
nnoremap <leader>rn ;call NumberToggle()<cr>

" Open file menu
nnoremap <Leader>o ;CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b ;CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f ;CtrlPMRUFiles<CR>
" Move among buffers with CTRL
map <C-K> ;bnext<CR>
map <C-J> ;bprev<CR>

" Delete without copy
nnoremap d "_d
vnoremap d "_d
vnoremap p "_dP

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
" nnoremap <leader>p "+p
" nnoremap <leader>P "+P
" vnoremap <leader>p "+p
" vnoremap <leader>P "+P

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

" Remap go to begin and end of function
nnoremap [[ ?{<CR>w99[{
nnoremap ][ /}<CR>b99]}
nnoremap ]] j0[[%/{<CR>
nnoremap [] k$][%?}<CR>

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1                           " Use Powerline fonts to show beautiful symbols
let g:airline_inactive_collapse = 0                         " Do not collapse the status line while having multiple windows
let g:airline#extensions#whitespace#enabled = 0             " Do not check for whitespaces
let g:airline#extensions#tabline#enabled = 1                " Display tab bar with buffers
let g:airline#extensions#branch#enabled = 1                 " Enable Git client integration
let g:airline#extensions#tagbar#enabled = 1                 " Enable Tagbar integration
let g:airline#extensions#hunks#enabled = 1                  " Enable Git hunks integration
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#right_sep = ' '
" let g:airline#extensions#tabline#right_alt_sep = '|'
" let g:airline_left_sep = ' '
" let g:airline_left_alt_sep = '|'
" let g:airline_right_sep = ' '
" let g:airline_right_alt_sep = '|'
let g:airline_theme= 'kalisi'
let g:airline#extensions#tabline#buffer_nr_show = 1

set background=dark
colorscheme kalisi
" colorscheme gruvbox

" YouComopleteMe
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_allow_changing_updatetime = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_filepath_completition_use_working_dir = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_filetype_whitelist = { '*': 1 }
" let g:ycm_key_invoke_completion = '<TAB>'
let g:ycm_key_invoke_completion = '<C-SPACE>'

let g:ycm_show_diagnostics_ui = 1
let g:ycm_confirm_extra_conf = 0
" let g:ycm_filetype_blacklist = ['r', 'tex']
" let g:ycm_filetype_specific_completion_to_disable = {
      " \ 'gitcommit': 1,
      " \ 'tex': 1
      " \}
nnoremap <leader>jt :YcmCompleter GetType<CR>
nnoremap <leader>jg :YcmCompleter GoTo<CR>
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>ji :YcmCompleter GoToInclude<CR>
nnoremap <leader>jf :YcmCompleter FixIt<CR>
nnoremap <F12> :YcmForceCompileAndDiagnostics <CR>

" Tex
" let g:tex_fast = ''
" let g:tex_fast = 'Mp'
let g:tex_flavor = 'latex'
" let g:vimtex_view_method = 'mupdf'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
" let g:vimtex_latexmk_options = '-pdf -verbose -file-line-error -interaction=nonstopmode -synctex=1 -recorder-'
let g:vimtex_latexmk_options = '-pdf -verbose -file-line-error -interaction=nonstopmode -synctex=1'
let g:vimtex_fold_enabled = 0
let g:vimtex_fold_manual = 1
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_open_on_warning = 0

if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter *.tex let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
" let g:ycm_semantic_triggers.tex = [
  " \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
  " \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
  " \ 're!\\hyperref\[[^]]*',
  " \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
  " \ 're!\\(include(only)?|input){[^}]*',
  " \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
  " \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
  " \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
  " \ ]

if !exists('g:deoplete#omni_patterns')
    let g:deoplete#omni_patterns = {}
endif
let g:deoplete#omni_patterns.tex =
            \ '\v\\%('
            \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
            \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
            \ . '|hyperref\s*\[[^]]*'
            \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
            \ . '|%(include%(only)?|input)\s*\{[^}]*'
            \ . ')\m'

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
let R_nvimpager = 'horizontal'
let R_assign = 0
let R_rconsole_width = 100

" Autoformat
" noremap <F3> :Autoformat<CR>

" let b:formatdef_custom_cpp='"astyle --mode=c -A14 --indent=spaces=2 --align-pointer=name"'
" let b:formatters_cpp = ['custom_cpp']

" let b:formatdef_custom_c='"astyle --mode=c -A14 --indent=spaces=2 --align-pointer=name"'
" let b:formatters_c = ['custom_c']

" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0

" Neoformat
noremap <F3> :Neoformat<CR>

let g:neoformat_enabled_cpp = ['astyle']

" NerdTree
map <C-n> ;NERDTreeToggle<CR>

" C++ color
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" Auto-pairs
let g:AutoPairsMultilineClose = 0

" DeliMate
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1

" " Neosnippet
" " Plugin key-mappings.
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" " SuperTab like snippets behavior.
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" "imap <expr><TAB>
" " \ pumvisible() ? "\<C-n>" :
" " \ neosnippet#expandable_or_jumpable() ?
" " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><C-j> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-j>"

" " For conceal markers.
" if has('conceal')
  " set conceallevel=2 concealcursor=niv
" endif

" nvim-R
let R_in_buffer = 1
let R_applescript = 0
let R_nvimpager = "no"
let R_notmuxconf = 1
let R_min_editor_width = 18

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

" Tslime
let g:tslime_always_current_session = 1 
let g:tslime_always_current_window = 1
vmap <leader>ss <Plug>SendSelectionToTmux
nmap <leader>ss <Plug>NormalModeSendToTmux
nmap <leader>sr <Plug>SetTmuxVars

" Vim-slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
" let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.1"}
let g:slime_no_mappings = 1
xmap <leader>ss <Plug>SlimeRegionSend
nmap <leader>ss <Plug>SlimeMotionSend
nmap <leader>ss <Plug>SlimeLineSend

" Semantic highlight
nnoremap <Leader>st :SemanticHighlightToggle<cr>
" let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]

" Ale
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_lint_delay = 200
highlight clear ALEWarningSign
let g:ale_r_lintr_options = "with_defaults(assignment_linter = NULL, camel_case_linter = NULL, snake_case_linter = NULL, absolute_paths_linter = NULL, spaces_inside_linter = NULL, line_length_linter(999))"
" let g:ale_completion_enabled = 1

" " lldb.nvim
" nmap <M-b> <Plug>LLBreakSwitch
" vmap <F2> <Plug>LLStdInSelected
" nnoremap <F4> :LLstdin<CR>
" nnoremap <F5> :LLmode debug<CR>
" nnoremap <S-F5> :LLmode code<CR>
" nnoremap <F7> :LL process launch<CR>
" nnoremap <S-F7> :LL process interrupt<CR>
" nnoremap <F8> :LL continue<CR>
" nnoremap <F9> :LL print <C-R>=expand('<cword>')<CR>
" " vnoremap <F9> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>

"Autoreload files when changed externally
set autoread

" Tagbar
nnoremap <F8> :TagbarToggle<CR>

" Cosco.vim
nmap <silent> <c-d> <Plug>(cosco-commaOrSemiColon)
imap <silent> <c-d> <c-o><Plug>(cosco-commaOrSemiColon)

