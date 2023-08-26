if (( ! $+commands[npm] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `npm`. Otherwise, compinit will have already done that.
COMPLETIONS_DIR=${$XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions
mkdir -p $COMPLETIONS_DIR
if [[ ! -f "$COMPLETIONS_DIR/_npm" ]]; then
  npm completion --shell=zsh >| "$COMPLETIONS_DIR/_npm" &|
  typeset -g -A _comps
  autoload -Uz _npm
  _comps[npm]=_npm
fi

source "$COMPLETIONS_DIR/_npm"
