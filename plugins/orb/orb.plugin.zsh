if (( ! $+commands[orb] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `orb`. Otherwise, compinit will have already done that.
COMPLETIONS_DIR=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions
mkdir -p $COMPLETIONS_DIR
if [[ ! -f "$COMPLETIONS_DIR/_orb" ]]; then
  typeset -g -A _comps
  autoload -Uz _orb
  _comps[orb]=_orb

  orb completion zsh >| "$COMPLETIONS_DIR/_orb" &|
fi
