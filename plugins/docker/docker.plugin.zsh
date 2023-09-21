if ! (($+commands[docker])); then
  return 0
fi

# TODO: fix this
return 0

if [[ ! -f $XDG_CACHE_HOME/zsh/completions/_docker ]]; then
    local url="https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker"
    if (($+commands[wget])); then
        wget -q -O $XDG_CACHE_HOME/zsh/completions/_docker $url
    else
        curl -fsSL $url -o $XDG_CACHE_HOME/zsh/completions/_docker
    fi
    source $XDG_CACHE_HOME/zsh/completions/_docker
fi

if (($+functions[__docker_subcommand_original])); then
  functions[__docker_subcommand_original]=$functions[__docker_subcommand]
  __docker_subcommand() {
      integer ret=1
      case "$words[1]" in
        (compose)
          __docker-compose_subcommand && ret=0
          ;;
        (*)
          return __docker_subcommand_original "$@"
          ;;
      esac
      return $ret
  }
  functions[__docker-compose_subcommand_original]=$functions[__docker-compose_subcommand]
fi
