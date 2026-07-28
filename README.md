# Vimski

A custom Neovim config

## Requirements

- [Neovim](https://github.com/neovim/neovim)
- Some terminal with true color support (for example [kitty](https://github.com/kovidgoyal/kitty))
- Some Nerd-Font
- [tmux](https://github.com/tmux/tmux)
- [ImageMagick](https://github.com/ImageMagick/ImageMagick)
- [Tree-sitter CLI](https://www.npmjs.com/package/tree-sitter-cli)
- [Go](https://go.dev/)

## Installation

### Linux/Mac

```sh
git clone --depth 1 git@github.com:Murmeltierchen/vimski.git ~/.config/nvim
nvim
```

## Custom Keybinds

Default bind for `Leader`: `Space`

### Single Keys

- `Esc`
    - `[n]` Exit git diffview
    - `[t]` Exit terminal mode
    - `Open suggestion window` Close suggestion window
- `F5` - Check file for changes
- `K` - Show hover menu

### Using Shift

- `Shift + <Up/Down/Left/Right>` - Switch window
- `Shift + Tab` - Dedent current line

### Using Ctrl

- `Ctrl + <Up/Down>` - Navigate 10 lines up/down
- `Ctrl + <0..9>` - Open terminal with ID
- `Ctrl + Space` - Open selection for previous files
- `Ctrl + Backspace` - Delete word in front of cursor
- `Ctrl + Delete` - Delete word after cursor
- `Ctrl + Enter` - Select colorscheme
- `Ctrl + Tab` - Indent current line
- `Ctrl + #` - Open selection of running terminals
- `Ctrl + ,` - Open new AI split
- `Ctrl + a` - Send file/selection to AI
- `Ctrl + b` - Toggle background transparency
- `Ctrl + d` - Remove entry from harpoon list
- `Ctrl + e` - Open harpoon list
- `Ctrl + g` - Open live grep
- `Ctrl + n` - Focus file tree
- `Ctrl + p` - Search git files
- `Ctrl + r` - Rename running terminal
- `Ctrl + s` - Format file
- `Ctrl + t` - Show TODOs

### Using Shift and Ctrl

- `Ctrl + Shift + <Up/Down>` - Move line up/down
- `Ctrl + Shift + 7` - Comment current line / visual selection
- `Ctrl + Shift + <p/n>` - Open previous/next harpoon file
- `Ctrl + Shift + d` - Open git diff
- `Ctrl + Shift + f` - Open git file history
- `Ctrl + Shift + h` - Open git history

### Using Leader

- `Leader` - Show all `Leader` keybinds
- `Leader -> Leader` - Open selection for files in buffer
- `Leader -> a` - Add file to harpoon list
- `Leader -> b` - Toggle git blame
- `Leader -> d` - Show definitions
- `Leader -> h` - Show hovered git changes
- `Leader -> ha` - Show all git changes
- `Leader -> n` - Hide marking after search
- `Leader -> r` - Show references
- `Leader -> t` - Test file
- `Leader -> ta` - Test all files
- `Leader -> x` - Show problems
