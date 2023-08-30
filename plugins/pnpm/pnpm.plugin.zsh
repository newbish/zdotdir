if ! (($+commands[pnpm])); then
  return 0
fi

local pnpmsc=$XDG_CACHE_HOME/repos/g-plane/pnpm-shell-completion
if [[ ! -d $pnpmsc ]]; then
  return 0
fi

if ! (($+commands[pnpm-shell-completion])); then
  pushd $pnpmsc > /dev/null
  source $pnpmsc/zplug.zsh > /dev/null &
  popd > /dev/null
fi

if [[ ! -f $XDG_CACHE_HOME/zsh/completions/_pnpm ]]; then
  cp $pnpmsc/pnpm-shell-completion.plugin.zsh $XDG_CACHE_HOME/zsh/completions/_pnpm
fi

return 0
