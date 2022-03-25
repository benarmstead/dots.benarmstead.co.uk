"curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.local/share/nvim/plugged')

Plug 'Pocco81/AutoSave.nvim'
"Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'neomake/neomake'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Mofiqul/dracula.nvim'
Plug 'karb94/neoscroll.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'mileszs/ack.vim'

call plug#end()

" Generic
filetype plugin on
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :v/\_s*\S/d
color dracula

"KeyMaps
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

" Colours
let g:markdown_fenced_languages = ['bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css']


" Formatting
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set linebreak
set number
syntax enable

"Coc
command! -nargs=0 Format :call CocAction('format')
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-prettier'
  \ ]


"Clipboard
"set clipboard=wl-clipboard

"Spell checking
set nospell spelllang=en_gb
"set invspell
nnoremap <silent> <F6> :set invspell<cr>
inoremap <silent> <F6> <C-O>:set invspell<cr>


" Comments
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Remap toggle to \cs and \c<space>


" AutoSave
" TextChanged < also a events for autosave
lua << EOF
local autosave = require("autosave")
autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {"sql"},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)
require('lualine').setup()
require("trouble").setup {}
EOF
