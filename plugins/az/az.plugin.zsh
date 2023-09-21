if (( ! $+commands[az] )); then
  return
fi

# TODO: fix this
return 0

COMPLETIONS_DIR=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/bash_completions
mkdir -p $COMPLETIONS_DIR
if [[ ! -f "$COMPLETIONS_DIR/_az" ]]; then
  wget --quiet https://raw.githubusercontent.com/Azure/azure-cli/dev/az.completion -O "$COMPLETIONS_DIR/_az"
fi

source "$COMPLETIONS_DIR/_az"
