# dotfiles

My dotfiles

# Install
After a `PluginInstall`.

Compile vimproc:

`cd ~/.vim/bundle/vimproc.vim && make`

Install YouCompleteMe

`cd ~/.vim/bundle/YouCompleteMe && ./install.sh`

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
