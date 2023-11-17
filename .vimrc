" Automatic installation of Vim-Plug.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" turn syntax highlighting on.
syntax on

"
" backspace
set backspace=indent,eol,start

" set not compatible with vi.  
set nocompatible

" vim will try to detect the type of file in use.  
filetype on

" enable plugins and load plugin for the detected file type.
filetype plugin on

" load an indent file for the detected file type.
filetype indent on

set autochdir
set smartindent
set foldenable
" set foldmethod=syntax

" show line number
set number

" set shift width to 4 spaces
set shiftwidth=4

" set tab width to 4 columns
set tabstop=4

" show matching words during a search
set showmatch

" use highlighting when doing a search
set hlsearch

" enable auto completion menu after pressing TAB
set wildmenu

" show the cmd run.
set showcmd

" enable mouse.
set mouse=a

" latex relative
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_syntax_conceal_disable=1
" Start server.
if empty(v:servername) && exists('*remote_startserver')
	call remote_startserver('VIM')
endif

if !exists("g:vim_window_id")
	let g:vim_window_id = system("xdotool getactivewindow")
endif

function! s:TexFocusVim() abort
	sleep 200m

	" Refocus Vim and redraw the screen
	" silent execute "!xdotool windowfocus " . expand(g:vim_window_id)
	echo "try to go back."
	execute "!xdotool windowfocus " . expand(g:vim_window_id)
	redraw!
endfunction

augroup vimtex_event_focus
	au!
	au User VimtexEventView call s:TexFocusVim()
augroup END

" Ultisnips
let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/Ultisnips']	" absolute path to the snippets directory.

" NERDTree
" Start NERDTree.
" autocmd VimEnter * NERDTree
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && 
" 			\bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
" 			\ let buf=bufnr() | buffer# | 
" 			\execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && 
" 			\exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" coc
let g:coc_disable_startup_warning = 1
" <CR> for completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() :
			\"<C-g>u\<CR>"
" <C-j>/<C-k> for selection
inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
" `[g` and `]g` to navigate diagnostics.
nmap <silent> [g <Plug>(coc-diagnostics-prev)
nmap <silent> ]g <Plug>(coc-diagnostics-next)

" bash-language-server
if executable('bash-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'bash-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
        \ 'allowlist': ['sh'],
        \ })
endif

" vim theme
syntax enable
set t_Co=256
" set background=light
" set background=dark
colorscheme quietlight
" colorscheme nord

if g:colors_name == "quietlight"
	set completeopt=menu,menuone,popup
	set completepopup=highlight:InfoPopup,border:off
endif

if g:colors_name == "gruvbox"
	set background=dark
endif

if g:colors_name == "nord"
	set background=dark
endif

" status line
" let g:airline_theme='onehalfdark'
set ch=1
set stl=%-.60F\ \ \ \ %f%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ %=\ %l,%c\ \ \ %=%P
set ls=2 " always showing statusline.

" fzf
set rtp+="$HOME/.fzf/bin/fzf"
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" find path.
let PWD=getcwd()
set path+=$PWD/**

" Plugins --------------------------------------------------------  {{{
call plug#begin('~/.vim/plugged')

" latex relative
Plug 'lervag/vimtex'

" vim-dispatch
Plug 'tpope/vim-dispatch'

" NERDtree
Plug 'preservim/nerdtree'

" winresizer
Plug 'simeji/winresizer'

" coc
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" gruvbox
Plug 'morhetz/gruvbox'

" intellij
Plug 'chiendo97/intellij.vim'

" indentLine
Plug 'Yggdroot/indentLine'

" vimspector, debugger 
Plug 'puremourning/vimspector'

" vim theme, papercolor
Plug 'NLKNguyen/papercolor-theme'

" vim theme, onehalf
Plug 'sonph/onehalf', { 'rtp': 'vim/' }

" vim theme, xcode
Plug 'arzg/vim-colors-xcode'

" fzf-vim 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" ayu theme.
Plug 'ayu-theme/ayu-vim'

" Quiet light theme.
Plug 'aonemd/quietlight.vim'

" Nord theme.
Plug 'arcticicestudio/nord-vim'

" Ultisnips.
Plug 'SirVer/ultisnips'

call plug#end()

" }}}


" Mappings --------------------------------------------------------  {{{
"
" cmd -> :nohl
nmap <C-L>		:nohl<CR>
"
" ============= vimspector ================

" When debugging, continue. Otherwise start debugging.
nmap <F9>		<Plug>VimspectorContinue

" Stop debugging. 
noremap <F6>	<Plug>VimspectorStop

" Restart debugging with the same configuration.
" nmap <S-F9>		<Plug>VimpectorRestart
" Reset.
nmap <silent> <S-F9> :VimspectorReset<CR>

" Step Over.
nmap <F8>		<Plug>VimspectorStepOver

" Step into. 
nmap <F7>		<Plug>VimspectorStepInto

" Step Out of current function scope. 
nmap <S-F8>		<Plug>VimspectorStepOut

" Evaluate expression under cursor (or visual) in popup.
" *: <A-S-8>
nmap *		<Plug>VimspectorBalloonEval
xmap *		<Plug>VimspectorBalloonEval

" Show/Hide the breakpoints window.
" ^: <A-S-6>
nmap ^		<Plug>VimspectorBreakpoints

" Run to cursor. 
" ): <S-0>
nmap )			<Plug>VimspectorRunToCursor

" Move cursor to the program counter in the current frame.
" (: <S-9>
nmap (			<Plug>VimspectorJumpToProgramCounter

" Move up a frame in the current call stack.
nmap <S-F12>	<Plug>VimspectorUpFrame

" Move down a frame in the current call stack.
nmap <F12>		<Plug>VimspectorDownFrame

" Toggle line breakpoint on the current line.
nmap <F5>		<Plug>VimspectorToggleBreakpoint

" Toggle conditional line breakpoint or logpoint on the current line
" ‡: <A-S-7>
nmap <S-F5>		<Plug>VimspectorToggleConditionalBreakpoint

" ============= find & actions  ================
" :FZF
nnoremap <silent> <C-f>	:FZF<CR>

" list buffers
nnoremap <silent> <leader>b	:buffers<CR>

" call shell
nmap <leader>s	:shell<CR>

" make.
nmap <leader>m	:make<CR>
" Make.
nmap <leader>M	:Make<CR>
 
"
"
" }}}
