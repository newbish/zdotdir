if (( ! $+commands[pdm] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `pdm`. Otherwise, compinit will have already done that.
COMPLETIONS_DIR=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions
mkdir -p $COMPLETIONS_DIR
if [[ ! -f "$COMPLETIONS_DIR/_pdm" ]]; then
  typeset -g -A _comps
  autoload -Uz _pdm
  _comps[pdm]=_pdm
fi

pdm completion zsh >| "$COMPLETIONS_DIR/_pdm" &|
