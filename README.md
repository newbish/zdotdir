# zdotdir

`$ZDOTDIR` contains my zsh configuration.

Customized from the repository at https://github.com/mattmc3/zdotdir

# Preperation
If you are not already using zsh.

Install zsh:

```bash
sudo apt install zsh
```

Change local shell to zsh:

```bash
chsh -s /bin/zsh
```

## Installation

It's a good idea to backup existing files first:

```zsh
setopt extended_glob
zfiles=(
  ${ZDOTDIR:-~}/.zsh*(.N)
  ${ZDOTDIR:-~}/.zlog*(.N)
  ${ZDOTDIR:-~}/.zprofile(.N)
)
mkdir -p ~/.bak
for zfile in $zfiles; do
  cp $zfile ~/.bak
done
unset zfile zfiles
```

Install this dotfiles repo to your `$ZDOTDIR`:

```zsh
# set the amazing ZDOTDIR variable
export ZDOTDIR=~/.config/zsh

# clone this repo
git clone --recursive https://github.com/dennispg/zdotdir.git $ZDOTDIR

# change the root .zshenv file to use ZDOTDIR
cat << 'EOF' >| ~/.zshenv
export ZDOTDIR=~/.config/zsh
[[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
EOF

```
