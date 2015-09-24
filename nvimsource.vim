" Note: The idea here is to have all the settings which are 
" neutral between nvim and vim in one place, sourced by the
" respective config files. The upside is that I don't have
" to continue with the tedious, error-prone process of updating
" one .rc and copy-pasting it to the other. I just need to make
" sure that this file (the file sourced by .vimrc and .nvimrc) 
" references only mutually accessible files and directories. 
"


set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set incsearch
set hlsearch
set ignorecase
set smartcase
set guifont=Hurmit\ PNFT\ Light
set sidescroll=0
" easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" neocomplete settings -- THESE HAVE BEEN ACTING SQUIRRELY!

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_smart_case = 1

" Default # of completions is 100, that's crazy.
let g:neocomplete#max_list = 25

" Set minimum syntax keyword length.
let g:neocomplete#auto_completion_start_length = 3

" Map standard Ctrl-N completion to Ctrl-Space
inoremap <C-Space> <C-n>

" This makes sure we use neocomplete completefunc instead of
" the one in rails.vim, otherwise this plugin will crap out.
" let g:neocomplete#force_overwrite_completefunc = 1

" Define keyword.
 if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
 endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Vim Airline ("Mode Line") Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#fugitive#enabled=1
let g:airline#extensions#syntastic#enabled=1

function! AirLineInit( )
	let g:airline_section_a = airline#section#create_left([' ', 'mode', '  ', 'branch'])
	let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', 'filetype'])
	let g:airline_section_c = airline#section#create(['%f'])
	let g:airline_section_x = airline#section#create_right(['%P'])
	let g:airline_section_y = airline#section#create_right(['%B'])
	let g:airline_section_z = airline#section#create_right(['%l','%c'])
endfunction
autocmd VimEnter * call AirLineInit( ) 

" CtrlP Settings 
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Directories to ignore
set wildignore+=*/smarty_c/**
set wildignore+=*/vendor/**
set wildignore+=*/bower_components/**

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1

" For indent-guides (which I should get if I don't have)
if exists('g:loaded_indent_guides')
  " indent-guides
  let g:indent_guides_start_level = 2
  let g:indent_guides_guide_size = 1
  let g:indent_guides_color_change_percent = 5
  :IndentGuidesEnable
endif


" Syntastic Settings
let g:syntastic_tex_checkers = ['lacheck']
"let g:syntastic_python_checkers = ['pylint']
let g:syntastic_check_on_open=0
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_enable_highlighting=1
let g:syntastic_echo_current_error=1

" WebdevIcons Settings
let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree=1
let g:webdevicons_enable_airline_tabline=1
let g:webdevicons_enable_airline_status=1
let g:WebDevIconsUnicodeDecorateFileNodes=1
let g:WebDevIconsUnicodeGlyphDoubleWidth=0 "dn-8.2.15 -- changed back 8.25
let g:webdevicons_conceal_nerdtree_brackets=1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
