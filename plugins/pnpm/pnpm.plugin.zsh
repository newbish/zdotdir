if ! (($+commands[pnpm])); then
  return 0
fi

local pnpmsc=$XDG_CACHE_HOME/repos/g-plane/pnpm-shell-completion
if [[ ! -d $pnpmsc ]]; then
  return 0
fi
if ! (($+commands[pnpm-shell-completion])); then
  pushd $pnpmsc > /dev/null
  local version=$(grep '^version =' Cargo.toml | cut -d'"' -f2)
  if [ $(uname) = "Darwin" ]; then
    if [ $(uname -m) = "arm64" ]; then
      target="aarch64-apple-darwin"
    else
      target="x86_64-apple-darwin"
    fi
  elif  [ $(uname) = "Linux" ]; then
    if [ $(uname -m) = "aarch64" ]; then
      target=""
    else
      target="x86_64-unknown-linux-musl"
    fi
  fi

  if [[ ! -z $target ]]; then
    local url="https://github.com/g-plane/pnpm-shell-completion/releases/download/v$version/pnpm-shell-completion_$target.zip"

    if [ $(hash wget 2>/dev/null) ]; then
        wget $url > zipball.zip
    else
        curl -fsSL $url -o zipball.zip
    fi

    unzip zipball.zip pnpm-shell-completion
    rm zipball.zip

  elif (($+commands[cargo])); then
    cargo clean && cargo build
    if [[ -f $pnpmsc/target/debug/pnpm-shell-completion ]]; then
      cp $pnpmsc/target/debug/pnpm-shell-completion $pnpmsc/pnpm-shell-completion
    fi
  fi
  popd > /dev/null
fi

if (($+commands[pnpm-shell-completion])) && [[ ! -f $XDG_CACHE_HOME/zsh/completions/_pnpm ]]; then
  mkdir -p $XDG_CACHE_HOME/zsh/completions
  cp $pnpmsc/pnpm-shell-completion.plugin.zsh $XDG_CACHE_HOME/zsh/completions/_pnpm
fi
