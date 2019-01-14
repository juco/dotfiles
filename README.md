# dotfiles

My dotfiles. Probably of little use to you.

# Install
Python3 support:

* `brew install python3`
* `pip3 install neovim`
* `pip3 install --upgrade neovim`

Verify with `:echo has("python3")`

Ruby support:
`gem install neovim`

For vim-monster:
`gem install rcodetools`

## Dependencies
* [vim-plug](https://github.com/junegunn/vim-plug)
* [the_silver_searcher](https://github.com/ggreer/the_silver_searcher)
* [reattach-to-user-namespace](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard)
* [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
* [powerline](https://github.com/powerline/powerline)

## Powerline install
Will need `psutil` for uptime: `pip3 install psutil`

## Notes
zsh theme: `pygmalion`

Font: `Roboto Nerd Font Complete`

List available colours:

```bash
for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
done
```

## Issues

### Tmux powerline flashes

Install `psutil` with `pip3 install psutil`
