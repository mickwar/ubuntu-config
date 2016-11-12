" majority by David Dahl, editted by Mickey Warner
" Basic stuff
syntax on               " Syntax highlighting
" set hlsearch                " Highlight search items
" set incsearch               " Highlight search items as you type
" set showmatch               " Show matches for parenthesis, etc.
set expandtab               " Use softtabs
set tabstop=4 shiftwidth=4  " Set tab width
" set background=dark         " Assume a light background (dark is the other option)
set number                  " add line numbers

colorscheme redmagick

filetype plugin on

" Return to last position
set viminfo='100,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 

" Keep text in visual mode when indenting or unindenting.
vmap < <gv
vmap > >gv
vmap <s-tab> <gv
vmap <tab> >gv

" Intelligent tab completion
"function! InsertTabWrapper(direction)
"  let col = col('.') - 1
"  if !col || getline('.')[col - 1] !~ '\k'
"    return "\<tab>"
"  elseif "backward" == a:direction
"    return "\<c-p>"
"  else
"    return "\<c-n>"
"  endif
"endfunction
"inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
"inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

" Line Feeder functionality
try
  source $MYVIMRC.line-feeder-3
catch
endtry

" disable auto commenting in all files (from vim.wikia.com/wiki/Disable_automatic_comment_insertion)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Execute a command from a shell
function ExecuteShellCommand(...)
  let cmd = ''
  let i = 1
  while i <= a:0
    let cmd = cmd . a:{i} . ' '
    let i = i + 1
  endwhile
  silent execute '!' . cmd
  redraw!
endfunction
command -nargs=+ E :call ExecuteShellCommand(<f-args>)

" Keybinding for word wrap
nnoremap <C-x> gqap

" Move between tabs --- Does not work within tmux.
nnoremap <silent> <A-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :tabprevious<CR>

" Switch to hex-editor
noremap <F8> :%!xxd<CR>
" Switch back
noremap <F7> :%!xxd -r<CR>

" map F1 to the escape key (as opposed to help menu)
" first map F1 to no operation
nmap <F1> <nop>
" map for normal mode, imap for when in interaction (?) mode
map <F1> <esc>
imap <F1> <esc>

" disable that annoying command history menu
nmap q: <nop>
vmap q: <nop>

" disable Ex mode (keeps you in command mode, type 'vi' to exit)
nmap Q <nop>

" make :W and :Q do the same thing as :w and :q
command W :w
command Q :q
command Wq :wq
command WQ :wq

" make shift-j and shift-k move left or right 147 (up and down lines with full screen, <1000 lines)
vmap <S-j> 208l
nmap <S-j> 208l
vmap <S-k> 208h
nmap <S-k> 208h
" make shift-h and shift-l move left or right 37 (quarter screen, <1000 lines)
vmap <S-l> 104l
nmap <S-l> 104l
vmap <S-h> 104h
nmap <S-h> 104h

" disable shift-h and shift-l which move you to top/bottom of screen
" vmap <S-h> <nop>
" nmap <S-h> <nop>
" vmap <S-l> <nop>
" nmap <S-l> <nop>

" make F5 disable highlight after searcing
nmap <silent> <F5> :silent noh<CR>

" delete sentence (go to visual mode, find next period, delete until that)
" nmap <C-d> v/[.]<esc>x:nohl<esc>
 
" Copy and paste between sessions
vmap <C-S-y> :w! ~/.vbuf<CR>      " copy the current visual selection to ~/.vbuf
nmap <C-S-p> :r ~/.vbuf<CR>       " paste the contents of the buffer file

