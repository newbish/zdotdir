if (( ! $+commands[fnm] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `fnm`. Otherwise, compinit will have already done that.
COMPLETIONS_DIR=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions
mkdir -p $COMPLETIONS_DIR
if [[ ! -f "$COMPLETIONS_DIR/_fnm" ]]; then
  typeset -g -A _comps
  autoload -Uz _fnm
  _comps[fnm]=_fnm
fi

fnm completions --shell=zsh >| "$COMPLETIONS_DIR/_fnm" &|
eval "$(fnm env --use-on-cd)"
