if exists('g:asyncomplete_loaded')
    finish
endif
let g:asyncomplete_loaded = 1

" patch-8.2.0782: https://github.com/vim/vim/pull/6063
" patch-8.2.0858: https://github.com/vim/vim/pull/6098
" patch-8.2:      https://github.com/vim/vim/pull/6246
let g:asyncomplete_use_lua = get(g:, 'asyncomplete_use_lua', has('nvim-0.5.0') || (has('lua') && has('patch-8.2.0782') && has('patch-8.2.0858')))

if g:asyncomplete_use_lua
    lua asyncomplete = require('asyncomplete')
    lua asyncomplete.init()
else
    " TODO: fallback to vimscript so it works when lua is not available
endif

" if get(g:, 'asyncomplete_enable_for_all', 1)
"     augroup asyncomplete_enable
"         au!
"         au BufEnter * if exists('b:asyncomplete_enable') == 0 | call asyncomplete#enable_for_buffer() | endif
"     augroup END
" endif

" let g:asyncomplete_manager = get(g:, 'asyncomplete_manager', 'asyncomplete#managers#vim#init')
" let g:asyncomplete_change_manager = get(g:, 'asyncomplete_change_manager', ['asyncomplete#utils#_on_change#textchangedp#init', 'asyncomplete#utils#_on_change#timer#init'])
" let g:asyncomplete_triggers = get(g:, 'asyncomplete_triggers', {'*': ['.', '>', ':'] })

" let g:asyncomplete_auto_completeopt = get(g:, 'asyncomplete_auto_completeopt', 1)
" let g:asyncomplete_auto_popup = get(g:, 'asyncomplete_auto_popup', 1)
" let g:asyncomplete_popup_delay = get(g:, 'asyncomplete_popup_delay', 30)
" let g:asyncomplete_log_file = get(g:, 'asyncomplete_log_file', '')
" let g:asyncomplete_preprocessor = get(g:, 'asyncomplete_preprocessor', [])

" inoremap <silent> <expr> <Plug>(asyncomplete_force_refresh) asyncomplete#force_refresh()
