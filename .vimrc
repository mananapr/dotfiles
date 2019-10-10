"" BIND <TAB> TO CHANGE BUFFERS
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>


"" EASYMOTION SETTINGS
nmap s <Plug>(easymotion-overwin-f)
nmap f <Plug>(easymotion-bd-w)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion


"" LIMELIGHT SETTINGS
let g:limelight_conceal_ctermfg = 241
let g:limelight_conceal_guifg = 240
let g:limelight_default_coefficient = 0.5


"" GENERAL KEYBINDINGS
map <C-n> :NERDTreeToggle<CR>
map <C-g> :Goyo<CR>
map <C-z> :set invnumber<CR>


"" CONTROL+Y COPIES TO EXTERNAL CLIPBOARD
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP


"" GENERAL VIM SETTINGS
set nu
set relativenumber
set autoindent
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set nowrap
set hidden
syntax on
colo wal


"" FIXES EXITING FROM GOYO
function! s:goyo_enter()
    set nu
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
              qa!
        else
              qa
        endif
    endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


"" USE HTML SYNTAX FOR EJS FILES
au BufNewFile,BufRead *.ejs set filetype=html
