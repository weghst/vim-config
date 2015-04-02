" Sample vimrc file by Kevin Zou


set enc=utf-8
set fenc=utf-8


" Rebind <Leader> key
" I like to have it here because it is easier to reach than the default and
" it it next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader=","
let g:mapleader=","


" Bind nohl
" Removes highlight of you last search
map <silent><leader><space> :noh<cr>


" Quick quit command
nmap <Leader>e :q<CR> " Quit current window
nmap <Leader>E :qa!<CR>  " Quit all windows


" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <Leader>[ <ESC>:tabp<CR>
map <Leader>] <ESC>:tabN<CR>


" bind CTRL+<movement> keys to move around windows, instead of usin CTRL+w+<movement>
" Every unecessary keystroke that can be saved is good for your health :)
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h


" Show whitespace
" must be inserted before the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s+$/


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype on
filetype plugin indent on
syntax on


" Showing line numbers and length
set nu     " show line numbers
set cursorline  " highlight current line
set tw=100 " width of document (used by gd)
set fo-=t  " don't automatically wrap text when typing
set colorcolumn=101
highlight colorcoloumn ctermbg=Gray guibg=Gray


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4

set ai  " Auto indent
set si  " Smart ident
set wrap    " Wrap lines

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase
hi Search cterm=none ctermfg=white ctermbg=green


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" Settings for netrw
let g:netrw_liststyle=3
let g:netrw_preview=1
let g:netrw_winsize=25


" Setup Pathogen to manage you plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -LSso ~/.vim/autoload/pathogen.vim
" https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
execute pathogen#infect()


" ==================================================================================================
" Plugin Setup
" ==================================================================================================


" Settings for Solarized
" cd ~/.vim/bundle
" git clone https://github.com/altercation/vim-colors-solarized
set t_Co=256
let g:solarized_italic=0
colorscheme solarized
set background=dark


" Settings for vim-airline
" cd ~/.vim/bundle
" git clone https://github.com/bling/vim-airline
set laststatus=2
let g:airline_theme="base16"


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim
let g:ctrlp_max_height=10
set wildignore+=*.pyc,*.class,*.o,*~


" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone --recursive https://github.com/davidhalter/jedi-vim.git
let g:jedi#popup_on_dot=0
let g:jedi#popup_select_first=0


" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action=='j'
            return "\<C-n>"
        elseif a:action=='k'
            return "\<C-p>"
        endif
    endif
    return a:action
endfunction

imap <silent><C-j> <C-r>=OmniPopup('j')<CR>
imap <silent><C-k> <C-r>=OmniPopup('k')<CR>


" Settings for UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"


" Settings for easymotion
" git clone https://github.com/Lokaltog/vim-easymotion
let g:EasyMotion_disable_two_key_combo=1
let g:EasyMotion_enter_jump_first=1 
map <Leader> <Plug>(easymotion-prefix)
