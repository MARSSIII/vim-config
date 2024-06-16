syntax enable

" Установка отступов (кол-во пробелов)
set tabstop=2
set shiftwidth=2

" умное регулирование отступов
set smarttab

" заменяет знак табуляции на пробелы
set expandtab

" автоматически выстовляет отступы
set smartindent

" установка формата файлов
set fileformat=unix
filetype plugin indent on

set noswapfile
set scrolloff=7

"Отключаем панели прокрутки в GUIi
set guioptions=0

"Отключаем панель табов (окошки FTW)
set showtabline=0

" soft wrapping
set wrap linebreak nolist

" установка максимальное длины строки
set textwidth=110

" изменение курсора относительно режимов редактирования 
set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей
let &t_SI.="\e[5 q" "SI = режим вставки
let &t_SR.="\e[3 q" "SR = режим замены
let &t_EI.="\e[1 q" "EI = нормальный режим

" использание русского языка
set keymap=russian-jcukenmac
" язык ввода при старте Вима - Английский
set iminsert=0
" aналогично настраивается режим поиска
set imsearch=0

" split окна по гор. и верт.
set splitbelow
set splitright

" ставить кодировку UTF-8
set encoding=UTF-8

" отключение обратное совместимости
set nocompatible 

inoremap jk <esc>

" проверка установки plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -flo ~/.vim/autoload/plug.vim --create dirs
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif 

" установка плагинов
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jackguo380/vim-lsp-cxx-highlight'

" colorscheme 
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox' 
Plug 'mhartington/oceanic-next'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'ayu-theme/ayu-vim'
Plug 'rafi/awesome-vim-colorschemes'

" для изменение status bar 
Plug 'vim-airline/vim-airline'

" файловый проводник
Plug 'preservim/nerdtree'

" доп к проводнику
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'ryanoasis/vim-devicons'

" интеграция slime
Plug 'jpalardy/vim-slime'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

"
" setting Colorscheme
"

colorscheme challenger_deep

" смена подсветки строки
set cursorline
nnoremap <F3> :set cursorline!<CR>
inoremap <F3> <C-o> :set cursorline!<CR>

highlight Cursorline term=bold cterm=bold guibg=Grey40

"
" autocompl setting
"

autocmd FileType python map <buffer> <C-h> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <C-h> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"
" setting vim-airline
"

let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу

"
" setting fonts
"

set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h16 

"
" setting NerdTree
"

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-e> :NERDTree<CR>
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-t> :NERDTreeFind<CR>

"
" setting highlights in NerdTree
"

let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

let g:NERDTreeDisableFileExtensionHighlight = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

" If you have vim-devicons you can customize your icons for each file type.
let g:NERDTreeExtensionHighlightColor = {} "this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = '' "assigning it to an empty string will skip highlight

let g:NERDTreeLimitedSyntax = 1

let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1

" set g:NERDTreeExtensionHighlightColor if you want a custom color instead of the default one
let g:NERDTreeSyntaxEnabledExtensions = ['hbs', 'lhs'] " enable highlight to .hbs and .lhs files with default colors
let g:NERDTreeSyntaxEnabledExactMatches = ['dropbox', 'node_modules', 'favicon.ico'] " enable highlight for dropbox and node_modules folders, and favicon.ico files with default colors

let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'c++', 'cpp', 'php', 'rb', 'js', 'css', 'html'] " enabled extensions with default colors
let g:NERDTreeSyntaxEnabledExactMatches = ['node_modules', 'favicon.ico'] " enabled exact matches with default colors

let g:NERDTreeHighlightCursorline = 0

"
" setting slime
"

"Для tmux
let g:slime_target = "tmux"

"Для обычного Вима
let g:slime_target = "vimterminal"

"
" setting LSP
"

let g:lsp_settings_root_markers = [
\   '.git',
\   '.git/',
\   '.svn',
\   '.hg',
\   '.bzr'
\ ]

let g:lsp_document_highlight_enabled = 0
highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

"
" debugging 
"

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/.lspLog/vim-lsp.log')

let g:asyncomplete_log_file = expand('~/.lspLog/asyncomplete.log')

