let mapleader = ","

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
Plug 'kana/vim-textobj-user'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
call plug#end()

set number relativenumber

" Disable arrow keys to encourage good vim style
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

nnoremap DD ^D

set visualbell

" Editor exit shortcuts
nnoremap <leader>ww :w<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>qq :q!<cr>

nnoremap Y y$

nnoremap H ^
nnoremap L $
nnoremap <c-j> ddp
nnoremap <c-k> ddkkp

nnoremap <space> i<space><esc>

inoremap jk <esc>

" visual maps
nnoremap <leader>iG ggVG
nnoremap <leader>iL ^v$


set scr=10

nnoremap <leader>cl ^D
nnoremap <leader>) F(%

let g:highlightedyank_highlight_duration=300

" ideaVim only settings
if has('ide')

    " set ideaVim settings
    set ideajoin

    " x for eXecute:
    nnoremap <leader>xr <Action>(Run)
    nnoremap <leader>xd <Action>(Debug)
    nnoremap <leader>xe <Action>(editRunConfigurations)
    nnoremap <leader>xcr <Action>(RunClass)
    nnoremap <leader>xcd <Action>(DebugClass)

    " n for New files
    nnoremap <leader>nn <Action>(NewFile)
    nnoremap <leader>nc <Action>(NewClass)
    nnoremap <leader>nb <Action>(NewScratchBuffer)

    " m for Maven
    nnoremap <leader>mr <Action>(Maven.Reimport)
    nnoremap <leader>mg <Action>(Maven.ExecuteGoal)
    nnoremap <leader>mm <Action>(ActivateMavenToolWindow)

    " c for Code
    nnoremap <leader>cq <Action>(SonarLint.AnalyzeChangedFiles)
    nnoremap <leader>cg <Action>(Generate)
    nnoremap <leader>== <Action>(ReformatCode)
    nnoremap <leader>co <Action>(OptimizeImports)
    nnoremap <leader>ce <Action>(GotoNextError)
    nnoremap <leader>cE <Action>(GotoPreviousError)
    nnoremap <leader>ca <Action>(Annotate)

    " b for Breakpoint
    nnoremap <leader>bb <Action>(ToggleLineBreakpoint)
    nnoremap <leader>ba <Action>(ViewBreakpoints)

    nnoremap <leader>rr <Action>(RenameElement)
    nnoremap <leader>dd <Action>(SafeDelete)

    nnoremap <leader>pp <Action>(TogglePresentationMode)

    " Editor Commands
    nnoremap <leader>qQ <Action>(CloseAllEditorsButActive)
    nnoremap <leader>QQ <Action>(CloseAllEditors)
    nnoremap <leader>qh <Action>(CloseAllToTheLeft)
    nnoremap <leader>ql <Action>(CloseAllToTheRight)

    nnoremap <leader>gi <Action>(GotoImplementation)
    nnoremap <leader>gd <Action>(GotoDeclaration)
    nnoremap <leader>gt <Action>(GotoTest)
    nnoremap <leader>gu <Action>(ShowUsages)

    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l
    nnoremap <c-s-h> <Action>(PreviousTab)
    nnoremap <c-s-l> <Action>(NextTab)
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
    syntax on

    set expandtab
    set tabstop=4
    set shiftwidth=4

    set splitright
    set noerrorbells
endif

