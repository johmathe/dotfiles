" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>
set mouse=a
execute pathogen#infect()
filetype indent plugin on
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:mapleader = ","
let mapleader = ","
nnoremap <leader>v <Plug>TaskList
set background=dark
set expandtab
set gcr=a:blinkon0
set history=1000
set noerrorbells
set nu
set ruler
set shiftwidth=4
set softtabstop=4
let color = 'dracula'
set tabstop=8
set wrap "Wrap lines
let g:airline_solarized_bg='dark'
syntax on
color dracula
"set list listchars=tab:\ \ ,trail:·
autocmd BufWritePost *.py call Flake8()
set backspace=indent,eol,start " backspace over everything in insert mode
let g:airline_theme='powerlineish'
let g:flake8_show_in_gutter=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
map <C-O> :call yapf#YAPF()<cr>
imap <C-O> <c-o>:call yapf#YAPF()<cr>
autocmd BufWritePre * :%s/\s\+$//e
set clipboard=unnamed

" map <C-B>:w | make -f Makefile.arm|copen
" map <C-N>:cn
map <C-B> :Denite file/rec<cr>
map <C-N> :cn<cr>
