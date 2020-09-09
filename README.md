# vim-config

## copy this to ~/.vimrc
  " Vim is based on Vi. Setting `nocompatible` switches from the default
  " Vi-compatibility mode and enables useful Vim functionality. This
  " configuration option turns out not to be necessary for the file named
  " '~/.vimrc', because Vim automatically enters nocompatible mode if that file
  " is present. But we're including it here just in case this config file is
  " loaded some other way (e.g. saved as `foo`, and then Vim started with
  " `vim -u foo`).
  set nocompatible

  " Turn on syntax highlighting.
  syntax on

  " Disable the default Vim startup message.
  set shortmess+=I

  " Show line numbers.
  set number

  " This enables relative line numbering mode. With both number and
  " relativenumber enabled, the current line shows the true line number, while
  " all other lines (above and below) are numbered relative to the current line.
  " This is useful because you can tell, at a glance, what count is needed to
  " jump up or down to a particular line, by {count}k to go up or {count}j to go
  " down.
  set relativenumber

  " Always show the status line at the bottom, even if you only have one window open.
  set laststatus=2

  " The backspace key has slightly unintuitive behavior by default. For example,
  " by default, you can't backspace before the insertion point set with 'i'.
  " This configuration makes backspace behave more reasonably, in that you can
  " backspace over anything.
  set backspace=indent,eol,start

  " Enable searching as you type, rather than waiting till you press enter.
  set incsearch

  " Unbind some useless/annoying default key bindings.
  nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

  " Disable audible bell because it's annoying.
  set noerrorbells visualbell t_vb=

  " When vim encounters a tabulation in a file you are opening, it displays the tab as {ts} spaces. (ts: tabstop)
  set ts=4

  " When you are editing a file and press the tab key, vim uses this setting to define the width of the inserted tabulation. (sts: softtabstop)
  set sts=4

  " The number of spaces vim uses when indenting, either using autoindent stuff or the usual >>, << commands. (sw: shiftwidth)
  set sw=8

  " Set auto indentation
  set autoindent
