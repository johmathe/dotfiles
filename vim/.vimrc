" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>
set mouse=r
execute pathogen#infect()
filetype indent plugin on
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:mapleader = ","
let mapleader = ","
nnoremap <leader>v <Plug>TaskList
set runtimepath^=~/.vim/bundle/ctrlp.vim
set background=dark
set expandtab
set gcr=a:blinkon0
set history=1000
set noerrorbells
set nu
set ruler
set shiftwidth=4
set softtabstop=4
set tabstop=8
set wrap "Wrap lines
syntax on
"set list listchars=tab:\ \ ,trail:·
autocmd BufWritePost *.py call Flake8()

if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%#warningmsg#
  set statusline+=%*
  let g:syntastic_enable_signs=1
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
let g:flake8_show_in_gutter=1
map <C-O> :call yapf#YAPF()<cr>
imap <C-O> <c-o>:call yapf#YAPF()<cr>
autocmd BufWritePre * :%s/\s\+$//e


" map <C-B>:w | make -f Makefile.arm|copen
" map <C-N>:cn
map <C-B> :make -f Makefile.arm<bar>copen<cr>
map <C-N> :cn<cr>


