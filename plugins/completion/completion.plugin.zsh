# Return if requirements are not found.
[[ "$TERM" != 'dumb' ]] || return 1

# Autoload plugin functions.
0=${(%):-%N}
fpath=(${0:A:h}/functions $fpath)
autoload -Uz ${0:A:h}/functions/*(.:t)

fpath=(
  # Add curl completions from homebrew.
  /{usr/local,opt/homebrew}/opt/curl/share/zsh/site-functions(-/FN)

  # Add zsh completions.
  /{usr/local,opt/homebrew}/share/zsh/site-functions(-/FN)

  # Add custom completions.
  $ZDOTDIR/completions(-/FN)

  ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/completions(-/FN)

  ${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions(-/FN)

  # rest of fpath
  $fpath
)

run-compinit
compstyle_setup
