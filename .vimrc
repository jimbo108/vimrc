set nocompatible			" required
filetype off				" required
let mapleader = ","
set mouse=a
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin()

Plug 'dense-analysis/ale'

" let g:ale_fixers = {
" \ 'html': ['prettier'],
" \ 'css': ['stylelint'],
" \}let g:ale_linters = {
" \ 'html': ['htmlhint'],
" \ 'css': ['stylelint'],
" \}

let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'yuezk/vim-js'
"Plug 'maxmellon/vim-jsx-pretty'
"Plug 'HerringtonDarkholme/yats.vim'
"
"Plug 'maxmellon/vim-jsx-pretty' 
Plug 'sheerun/vim-polyglot'
call plug#end()

call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'jiangmiao/auto-pairs'

Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

Plugin 'vim-scripts/indentpython.vim'

" Plugin 'ycm-core/YouCompleteMe'

"@colorscheme solarized

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR><CR>
map <leader>h :YcmCompleter GoToReferences<CR>
"silent !:YcmCompleter GoToDefinitionElseDeclaration
let g:ycm_python_binary_path='./env/bin/python'
set nomore
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"

"let g:ycm_global_ycm_extra_conf="~/vim/bundle/YouCompleteMe/
Plugin 'vim-syntastic/syntastic'

Plugin 'nvie/vim-flake8'

Plugin 'jnurmine/Zenburn'
Plugin 'morhetz/gruvbox'

@colorscheme gruvbox
Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
" fzf

Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

nmap <leader>; :Buffers<CR>
nmap <leader>t :Files<CR>
nmap <leader>r :Tags<CR>

if executable('ag')
    let $FZF_DEFAULT_COMMAND = 'ag -g ""'
endif

Plugin 'mileszs/ack.vim'

if executable('ag')
	let g:ackprg = 'ag -i --vimgrep'
endif

Plugin 'tpope/vim-fugitive'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

"...

" All of your Plugins must be added before the following line
call vundle#end()			" required
filetype plugin indent on 		" required

" full stack
au BufNewFile,BufRead *.js
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 | 
	\ set textwidth=79 | 
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

au BufNewFile,BufRead *.jsx
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 | 
	\ set textwidth=79 | 
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix


" full stack
au BufNewFile,BufRead *.html
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 | 
	\ set textwidth=79 | 
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix 


" python
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 | 
	\ set textwidth=119 | 
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix 

let python_highligh_all=1
syntax on

" whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h "match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.txt
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4

" Enable folding
set foldmethod=indent
set foldlevel=99

" general
inoremap jk <Esc>

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set encoding=utf-8

nnoremap <space> za

" vscode open
nnoremap <leader>ov :exe ':silent !code %'<CR>:redraw!<CR>

" switch tabs
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

"Mode Settings

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set nu

set rtp+=~/usr/local/opt/fzf
set clipboard=unnamed
set colorcolumn=119

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


