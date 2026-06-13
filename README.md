sychen/vimrc
============

A long-lived Vim configuration tuned for Verilog/SystemVerilog, C/C++,
and Python, in both terminal Vim and the MacVim/GTK GUIs.

## Installation

Clone:

```
git clone git://github.com/sychen/vimrc.git ~/.vim
```

Create symlinks:

```
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
```

## Requirements

Vim 9.1+ is assumed (the built-in `comment` and `matchit` packages and
`listchars` indent guides are loaded with `packadd` / `leadmultispace`).

Some plugins drive external tools. On macOS:

```
brew install ripgrep universal-ctags fzf ruff node
```

| Tool             | Used by   | Purpose                                  |
| ---------------- | --------- | ---------------------------------------- |
| `ripgrep` (`rg`) | ack.vim   | backend for `:Ack` / `<F4>` search       |
| `universal-ctags`| Tagbar    | symbol outline (`<F3>`)                  |
| `fzf`            | fzf.vim   | fuzzy file/buffer pickers                |
| `ruff`           | ALE       | Python linting                           |
| `node`           | coc.nvim  | LSP client runtime                       |
| `clangd`         | coc-clangd| C/C++ LSP (ships with the Xcode CLT)     |

Everything degrades gracefully: hosts missing a tool fall back to the
plain default (e.g. `ack` instead of `rg`) or skip the feature.

## Plugin Management (using vim-plug)

Edit the list:

```
vim ~/.vim/plugin-list.vim
```

Operations:

```
:PlugInstall   " install newly added plugins
:PlugUpdate    " update installed plugins
:PlugClean     " remove plugins no longer listed
:PlugUpgrade   " update vim-plug itself
```

Per-machine plugins can be dropped into `~/.vim/local/<name>/`; each
subdirectory is loaded automatically as an unmanaged plugin (vim-plug
never installs, updates, or cleans these).

## Assistant Windows

```
 <F3>                          <F5>
Tagbar                       NERDTree
        <F4> Grep & Quickfix
```

## Key Bindings

Leader is `,`.

### Navigation & search

| Key            | Action                                     |
| -------------- | ------------------------------------------ |
| `<C-p>`        | fuzzy file picker (`:Files`)               |
| `<leader>b`    | buffer picker (`:Buffers`)                 |
| `<leader>t`    | window picker (`:Windows`)                 |
| `<F4>`         | grep word under cursor, whole tree         |
| `<S-F4>`       | grep word under cursor, current dir only   |
| `<F12>`        | next quickfix entry                        |
| `<C-h/j/k/l>`  | move between windows                       |

### Editing

| Key                | Action                                 |
| ------------------ | -------------------------------------- |
| `gcc` / `gc{motion}`| toggle comment (built-in `comment`)   |
| `ga` (visual/normal)| align (`vim-easy-align`)              |
| `<leader>w`        | save (`:w!`)                           |
| `<F2>`             | toggle paste mode                      |

### LSP (coc.nvim)

| Key          | Action                              |
| ------------ | ----------------------------------- |
| `gd`         | go to definition                    |
| `gy`         | go to type definition               |
| `gr`         | find references                     |
| `K`          | hover documentation                 |
| `[g` / `]g`  | previous / next diagnostic          |
| `<leader>rn` | rename symbol                       |
| `<Tab>` / `<S-Tab>` | navigate completion menu     |
| `<CR>`       | confirm completion                  |
| `<C-Space>`  | trigger completion                  |

Language servers (`coc-pyright`, `coc-clangd`) install automatically on
the first interactive launch; check status with `:CocList extensions`.

### Toggles

| Key          | Action                              |
| ------------ | ----------------------------------- |
| `<F3>` / `<leader>T` | Tagbar                      |
| `<F5>` / `<leader>e` | NERDTree                    |
| `<leader>E`  | edit `~/.vim/vimrc`                 |
| `<leader>v` / `<leader>s` | vertical / horizontal split    |
| `<leader>n`  | new tab                             |
| `<leader>1`..`<leader>0` | jump to tab 1..10       |

## Sessions

`:Obsession` starts a self-updating session in the current directory;
resume later with `vim -S Session.vim`. `:Obsession!` stops tracking and
removes the session file.

## Local Overrides

These files are sourced if present, for per-host tweaks kept out of the
repository:

- `~/.vim/vimrc-local`
- `~/.vim/gvimrc-local`
