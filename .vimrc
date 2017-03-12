set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Yusuf's plugin

" 1. PHP Syntax Highlighting
Plugin 'StanAngeloff/php.vim'
" 2. PHP Linter
Plugin 'https://github.com/joonty/vim-phpqa'
" 3. Tree windows
Plugin 'scrooloose/nerdtree'
" 4. Grepper
Plugin 'mhinz/vim-grepper'
" 5. Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'ctrlpvim/ctrlp.vim'
" 6. Maximizes and restores the current window in Vim.
Plugin 'szw/vim-maximizer'
" 7. VimDevIcons adds filetype glyphs (icons) to other plugins (dep: ryanoasis/nerd-fonts#font-installation). 
Plugin 'ryanoasis/vim-devicons'
" 8. fatih/vim-go 
Plugin 'fatih/vim-go'

"End of Yusuf's plugin

" All of your Plugins must` be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


execute pathogen#infect()
set nu

" NerdTree
map <C-\> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Next tab
map <C-Left> :tabp<CR>
map <C-Right> :tabn<CR>
map <C-Down> :tabclose<CR>
map <C-Up> :tabnew<CR>

" vim-maximizer
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

" Tab configuration
" filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Omni Complete
set omnifunc=syntaxcomplete#Complete

" VimDevIcons Iconsi
set encoding=utf8

" if PHP File
autocmd FileType php map <C-s> :Php<CR>
autocmd FileType php map <C-a> :Phpcs<CR>
autocmd FileType php au vimEnter * NERDTree

" Put at the very end of your .vimrc file.
function! PhpSyntaxOverride()
   hi! def link phpDocTags  phpDefine
   hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
   autocmd!
   autocmd FileType php call PhpSyntaxOverride()
augroup END
