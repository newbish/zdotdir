#
# Init
#

0=${(%):-%N}
fpath+="${0:A:h}/functions"
autoload -Uz promptinit && promptinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ${ZDOTDIR:-~}/themes/.p10k.zsh ]] || source ${ZDOTDIR:-~}/themes/.p10k.zsh

prompt_powerlevel10k_setup

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet