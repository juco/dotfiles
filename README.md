# dotfiles

My dotfiles

# Install
After a `PluginInstall`.

Compile vimproc:

`cd ~/.vim/bundle/vimproc.vim && make`

Install YouCompleteMe

`cd ~/.vim/bundle/YouCompleteMe && ./install.sh`

## Dependencies
* the_silver_searcher
* reattach-to-user-namespace

## Notes
zsh theme: `pygmalion`

List available colours:

```bash
for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
done
```
