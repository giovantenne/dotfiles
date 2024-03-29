" Leader key
let mapleader=","

" RSpec.vim mappings
map <Leader>x :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
let g:rspec_command = "Dispatch rspec {spec}"

:imap kj <Esc>
:imap jk <Esc>

" quick save and quit!
nnoremap s :w<CR>

" Move more naturally up/down when wrapping is enabled.
nnoremap j gj
nnoremap k gk

" Easier access to system clipboard
" nnoremap P "*p
" nnoremap Y "*y
"
" stop entering in ex mode
nnoremap Q <nop>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Move to beginning and end of line easily
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" Default charset encoding.
set encoding=utf-8

" Airline tab
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" Airline
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#bufferline#enabled = 0

" The silver searcher
let g:ag_working_path_mode="r"

" Local dirs
if !has('win32')
  set backupdir=~/.dotfiles/caches/vim
  set directory=~/.dotfiles/caches/vim
  set undodir=~/.dotfiles/caches/vim
  let g:netrw_home = expand('~/.dotfiles/caches/vim')
endif

augroup vimrc
  autocmd!
augroup END

syntax enable

autocmd vimrc ColorScheme * :hi NonText ctermfg=236
autocmd vimrc ColorScheme * :hi SpecialKey ctermfg=236
" Show trailing whitespace.
autocmd vimrc ColorScheme * :hi ExtraWhitespace ctermbg=red guibg=red
" Make selection more visible.
autocmd vimrc ColorScheme * :hi Visual term=reverse cterm=reverse guibg=Grey
autocmd vimrc ColorScheme * :hi CursorLine   cterm=NONE ctermbg=237

let g:molokai_italic=0
" colorscheme molokai
" color dracula
" color monokai
color molokai
" color railscasts
" colorscheme badwolf
set background=dark


set cursorline " Highlight current line
set number " Enable line numbers.
set showtabline=2 " Always show tab bar.
" set relativenumber " Use relative line numbers. Current line is still in status bar.
" set title " Show the filename in the window titlebar.
set nowrap " Do not wrap lines.
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set laststatus=2 " Always show status line

" Show absolute numbers in insert mode, otherwise relative line numbers.
autocmd vimrc InsertEnter * :set norelativenumber
" autocmd vimrc InsertLeave * :set relativenumber

" Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=+1

" Scrolling
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set sidescrolloff=3 " Start scrolling three columns before vertical border of window.

" Indentation
set autoindent " Copy indent from last line when starting new line.
set shiftwidth=2 " The # of spaces for indenting.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set softtabstop=2 " Tab key results in 2 spaces
set tabstop=2 " Tabs indent only 2 spaces
set expandtab " Expand tabs to spaces

" Reformatting
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command.

" Toggle show tabs and trailing spaces (,c)
if has('win32')
  set listchars=tab:>\ ,trail:.,eol:$,nbsp:_,extends:>,precedes:<
else
  set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:>,precedes:<
endif
"set listchars=tab:>\ ,trail:.,eol:$,nbsp:_,extends:>,precedes:<
"set fillchars=fold:-
nnoremap <silent> <leader>vv :call ToggleInvisibles()<CR>

" Extra whitespace
autocmd vimrc BufWinEnter * :2match ExtraWhitespaceMatch /\s\+$/
autocmd vimrc InsertEnter * :2match ExtraWhitespaceMatch /\s\+\%#\@<!$/
autocmd vimrc InsertLeave * :2match ExtraWhitespaceMatch /\s\+$/

" Toggle Invisibles / Show extra whitespace
function! ToggleInvisibles()
  set nolist!
  if &list
    hi! link ExtraWhitespaceMatch ExtraWhitespace
  else
    hi! link ExtraWhitespaceMatch NONE
  endif
endfunction

set nolist
call ToggleInvisibles()
call ToggleInvisibles()

" Trim extra whitespace
function! StripExtraWhiteSpace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction
noremap <leader>ss :call StripExtraWhiteSpace()<CR>

" Search / replace
set gdefault " By default add g flag to search/replace. Add g to toggle.
" set hlsearch " Highlight searches
set incsearch " Highlight dynamically as pattern is typed.
set ignorecase " Ignore case of searches.
set matchtime=2
set matchpairs+=<:>

set smartcase " Ignore 'ignorecase' if search pattern contains uppercase characters.

" Clear last search
map <silent> <leader>/ <Esc>:nohlsearch<CR>

" Ignore things
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/log/*,*/tmp/*

" Vim commands
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set report=0 " Show all changes.
set mouse=n " Enable mouse in all modes.
set shortmess+=I " Hide intro menu.

" Splits
set splitbelow " New split goes below
set splitright " New split goes right

" Ctrl-J/K/L/H select split
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Buffer navigation
" nnoremap <leader>b :CtrlPBuffer<CR> " List other buffers
noremap <leader>b :CtrlPBuffer<CR>
map <leader>m :b#<CR> " Switch between the last two files
map gn :BufSurfForward<cr> " next buffer
map gb :BufSurfBack<CR> " Prev buffer

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" Use Q for formatting the current paragraph (or selection)
" vmap Q gq
" nmap Q gqap

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" When editing a file, always jump to the last known cursor position. Don't do
" it for commit messages, when the position is invalid, or when inside an event
" handler (happens when dropping a file on gvim).
autocmd vimrc BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

autocmd vimrc BufRead .vimrc,*.vim set keywordprg=:help

" markdown
autocmd vimrc BufRead,BufNewFile *.md set filetype=markdown


" NERDTree
let NERDTreeShowHidden = 0
" let NERDTreeMouseMode = 2
let NERDTreeMinimalUI = 1

map <leader>f :NERDTreeToggle<CR>
" press C to change the current directory
" press U to move up from starting directory

" Close VIM if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd vimrc StdinReadPre * let s:std_in=1

" If no file or directory arguments are specified, open NERDtree.
" If a directory is specified as the only argument, open it in NERDTree.
autocmd vimrc VimEnter *
  \ if argc() == 0 && !exists("s:std_in") |
  \   NERDTree |
  \ elseif argc() == 1 && isdirectory(argv(0)) |
  \   bd |
  \   exec 'cd' fnameescape(argv(0)) |
  \   NERDTree |
  \ end

" Signify
let g:signify_vcs_list = ['git', 'hg', 'svn']

" CtrlP.vim
map <leader>p <C-P>
map <leader>r :CtrlPMRUFiles<CR>
"let g:ctrlp_match_window_bottom = 0 " Show at top of window

let g:user_emmet_leader_key='<C-X>'

" Indent Guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['nerdtree']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=240
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=NONE
"
" https://github.com/junegunn/vim-plug
" Reload .vimrc and :PlugInstall to install plugins.

" for haya14busa/incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
  " let &t_SR = "\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"

  " let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  " let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  " let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  if has("autocmd")
    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
    au InsertEnter,InsertChange *
      \ if v:insertmode == 'i' |
      \   silent execute '!echo -ne "\e[6 q"' | redraw! |
      \ elseif v:insertmode == 'r' |
      \   silent execute '!echo -ne "\e[4 q"' | redraw! |
      \ endif
    au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
  endif
endif

" let g:jsx_ext_required = 0

noremap <leader>gr :vsplit config/routes.rb<cr>
noremap <leader>gs :vsplit db/schema.rb<cr>
noremap <leader>gg :vsplit Gemfile<cr>

nnoremap <leader>v :execute "vsplit " . bufname("#")<CR>
nnoremap <leader>i :execute "split " . bufname("#")<CR>
nnoremap <leader>q :q<CR>

vmap <Leader>z :call I18nTranslateString()<CR>
vmap <Leader>dt :call I18nDisplayTranslation()<CR>

nmap <leader>dd "xdd
vmap <leader>d "xd
vmap <leader>y "xy
map <leader>p "xp


let g:ansible_unindent_after_newline = 1
let g:pymode_rope = 0

" set clipboard=unnamedplus

" Arduino setup
let g:arduino_cmd = '/snap/bin/arduino'
let g:arduino_dir = '/home/claudio/snap/arduino/current'
let g:arduino_home_dir = '/home/claudio/snap/arduino/33/.arduino15'

" HELTEC
let g:arduino_board = 'esp32:esp32:heltec_wifi_kit_32:FlashSize=4M,DebugLevel=none,UploadSpeed=921600,PartitionScheme=default,CPUFreq=240,FlashMode=qio,FlashFreq=40,PSRAM=disabled'

" TTGO
" TEST let g:arduino_board = 'esp32:esp32:esp32:FlashSize=4M,DebugLevel=none,UploadSpeed=921600,PartitionScheme=app3M_fat9M_16MB,CPUFreq=240,FlashMode=qio,FlashFreq=40,PSRAM=disabled'
" TEST let g:arduino_board = 'esp32:esp32:esp32:FlashSize=4M,DebugLevel=none,UploadSpeed=921600,PartitionScheme=default,CPUFreq=240,FlashMode=qio,FlashFreq=40,PSRAM=disabled'
" let g:arduino_board = 'esp32:esp32:esp32:FlashSize=4M,DebugLevel=none,UploadSpeed=921600,PartitionScheme=huge_app,CPUFreq=240,FlashMode=qio,FlashFreq=40,PSRAM=disabled'

let g:arduino_serial_baud = 115200
let g:arduino_serial_cmd = 'picocom {port} -b 115200 -l'

let g:slime_paste_file = tempname()
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:arduino_use_slime = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
nnoremap <leader>am :ArduinoVerify<CR>
nnoremap <leader>au :ArduinoUpload<CR>
nnoremap <leader>as :ArduinoSerial<CR>
nnoremap <leader>aus :ArduinoUploadAndSerial<CR>
" Exit serial with CRTL+aax

set path=.,src,node_nodules
set suffixesadd=.js,.jsx

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" let g:polyglot_disabled = ['jsx']

call plug#begin('~/.vim/plugged')

Plug 'maxmellon/vim-jsx-pretty'
" Plug 'sheerun/vim-polyglot'
Plug 'bling/vim-airline'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-signify'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-dispatch'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'tpope/vim-endwise'
Plug 'haya14busa/incsearch.vim'
Plug 'ton/vim-bufsurf'
Plug 'mbbill/undotree'
Plug 'iberianpig/tig-explorer.vim'
Plug 'stevearc/vim-arduino'
Plug 'jpalardy/vim-slime'
Plug 'pearofducks/ansible-vim'
Plug 'tomlion/vim-solidity'
Plug 'leafgarland/typescript-vim'

call plug#end()
