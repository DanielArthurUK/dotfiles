let mapleader = ","

if has('ide')
    function! plug#begin(foo)
    endfunction

    function! plug#end()
    endfunction
endif

call plug#begin('~/.vim/plugged')
" Plugins supported by both IdeaVim and Vim
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/argtextobj.vim'
Plug 'kana/vim-textobj-entire'
Plug 'tommcdo/vim-exchange'
Plug 'preservim/nerdtree'

" Other plugins supported only by Vim
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'kana/vim-textobj-user'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

set number relativenumber

" Disable arrow keys to encourage good vim style
nmap <Up> <nop>
nmap <Down> <nop>
nmap <Left> <nop>
nmap <Right> <nop>

nmap DD ^D

set visualbell

" Editor exit shortcuts
nmap <leader>ww :w<cr>
nmap <leader>wq :wq<cr>
nmap <leader>qq :q!<cr>

nmap Y y$

nmap H ^
nmap L $
nmap <c-j> ddp
nmap <c-k> ddkkp

nmap <space> i<space><esc>

imap jk <esc>

" visual maps
nmap <leader>iG ggVG
nmap <leader>iL ^v$


set scr=10

nmap <leader>cl ^D
nmap <leader>) F(%

let g:highlightedyank_highlight_duration=300

" ideaVim only settings
if has('ide')

    " set ideaVim settings
    set ideajoin

    " x for eXecute:
    nmap <leader>xr <Action>(Run)
    nmap <leader>xd <Action>(Debug)
    nmap <leader>xe <Action>(editRunConfigurations)
    nmap <leader>xcr <Action>(RunClass)
    nmap <leader>xcd <Action>(DebugClass)

    " n for New files
    nmap <leader>nn <Action>(NewFile)
    nmap <leader>nc <Action>(NewClass)
    nmap <leader>ns <Action>(NewScratchFile)
    nmap <leader>nb <Action>(NewScratchBuffer)

    " m for Maven
    nmap <leader>mr <Action>(Maven.Reimport)
    nmap <leader>mg <Action>(Maven.ExecuteGoal)
    nmap <leader>mm <Action>(ActivateMavenToolWindow)

    " c for Code
    nmap <leader>cq <Action>(SonarLint.AnalyzeChangedFiles)
    nmap <leader>cg <Action>(Generate)
    nmap <leader>== <Action>(ReformatCode)
    nmap <leader>co <Action>(OptimizeImports)
    nmap <leader>ce <Action>(GotoNextError)
    nmap <leader>cE <Action>(GotoPreviousError)
    nmap <leader>ca <Action>(Annotate)

    " b for Breakpoint
    nmap <leader>bb <Action>(ToggleLineBreakpoint)
    nmap <leader>ba <Action>(ViewBreakpoints)

    nmap <leader>rr <Action>(RenameElement)
    nmap <leader>dd <Action>(SafeDelete)

    nmap <leader>pp <Action>(TogglePresentationMode)

    " Editor Commands
    nmap <leader>qQ <Action>(CloseAllEditorsButActive)
    nmap <leader>QQ <Action>(CloseAllEditors)
    nmap <leader>qh <Action>(CloseAllToTheLeft)
    nmap <leader>ql <Action>(CloseAllToTheRight)

    nmap <leader>gi <Action>(GotoImplementation)
    nmap <leader>gd <Action>(GotoDeclaration)
    nmap <leader>gt <Action>(GotoTest)
    nmap <leader>gu <Action>(ShowUsages)

    nmap <c-h> <c-w>h
    nmap <c-l> <c-w>l
    nmap <c-s-h> <Action>(PreviousTab)
    nmap <c-s-l> <Action>(NextTab)
else
    if &term =~ '^xterm'
        " solid underscore
        let &t_SI .= "\<Esc>[6 q"
        " solid block
        let &t_EI .= "\<Esc>[2 q"
        " 1 or 0 -> blinking block
        " 3 -> blinking underscore
        " Recent versions of xterm (282 or above) also support
        " 5 -> blinking vertical bar
        " 6 -> solid vertical bar
    endif
    set encoding=utf-8
    set expandtab tabstop=4 shiftwidth=4
    set splitright
    set noerrorbells

    syntax on
    set termguicolors
    colorscheme onedark
    set noshowmode
    set laststatus=2
    let g:lightline = {
        \ 'colorscheme': 'onedark',
        \ 'active': {
        \   'left': [['mode', 'paste'],
        \       ['gitbranch', 'readonly', 'filename', 'modified']]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead'
        \ }
        \ }
endif

