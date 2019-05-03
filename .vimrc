let $BUNDLE = expand("$HOME/.vim/bundle")
let $PLUG_DIR = expand("$BUNDLE/vim-plug")

if empty(glob(expand("$PLUG_DIR/plug.vim")))
  silent !curl -fLo $PLUG_DIR/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif
source $PLUG_DIR/plug.vim

call plug#begin(expand($BUNDLE))
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'luochen1990/rainbow'
call plug#end()

set number
colorscheme evening
set guifont=Courier_new\ 14
set backspace=indent,eol,start
set cindent
set autoindent
set shiftwidth =4
set tabstop =4
set tags =./tags;,tags

"-------------------------------------------------------
"                                     RAINBOW_BRACKET
let g:rainbow_active = 1
"-------------------------------------------------------
"                                            NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <c-n> :NERDTreeToggle<CR>

"-------------------------------------------------------
"                                                 ALE
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_linters={
\ 'cpp': ['gcc'],
\ 'c': ['gcc'],
\    }

map <c-a> :ALEToggle<CR>

"-------------------------------------------------------
"                                               tagbar
map <c-m> :TagbarToggle<CR>




"-------------------------------------------------------
"                                            Highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1


"--------------------------------------------------------
"                                           YcmComplteMe
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c:-z>'
set completeopt=menu,menuone
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }


"----------------------------------------------------------
"                                              


