set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'      
Plugin 'Yggdroot/indentLine'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:indentLine_char = '|'
let g:indentLine_enabled = 0

hi Search cterm=NONE ctermfg=black ctermbg=yellow
set mouse=a
set hlsearch
set number
set clipboard=unnamed
set term=xterm-256color
syntax on
set nocursorcolumn
set nocursorline
execute pathogen#infect()
set backspace=2
set tabstop=2 shiftwidth=2 expandtab
set autoindent
set runtimepath^=~/.vim/bundle/ctrlp.vim
set noswapfile
let g:loaded_matchparen=1
set splitright
set splitbelow
nmap <F6> :bn<CR>
nmap <F5> :bp<CR>
nmap <Space><Space> :call InsertDebugger()<CR>
nmap <Esc><Esc> :noh<return>

autocmd VimEnter * NERDTree
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

function! InsertDebugger()
   if(&filetype == 'ruby')
   :normal orequire 'pry'; binding.pry
   else
   :normal odebugger;
   endif
   :normal ==
endfunction
