"set transparency=20
set guioptions=me

if has("gui_running")
  if has("gui_gtk2")
    "set guifont=DejaVu\ Sans\ Mono\ 11
    "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
    set guifont=SauceCodePowerline-Light 11
  elseif has("gui_macvim")
    "set guifont=DejaVu\ Sans\ Mono:h14
    "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
    set guifont=SauceCodePowerline-Light:h12
  endif
endif

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif
