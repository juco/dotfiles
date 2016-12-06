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
* [https://github.com/junegunn/vim-plug](vim-plug)
* [https://github.com/ggreer/the_silver_searcher](the_silver_searcher)
* [https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard](reattach-to-user-namespace)

## Notes
zsh theme: `pygmalion`

List available colours:

```bash
for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
done
```
