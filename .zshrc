# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zstyles
[[ -r $ZDOTDIR/.zstyles ]] && . $ZDOTDIR/.zstyles

# antidote plugin manager
[[ -d $ANTIDOTE_HOME/mattmc3/antidote ]] ||
  git clone --depth 1 --quiet https://github.com/mattmc3/antidote $ANTIDOTE_HOME/mattmc3/antidote
fpath+=($ANTIDOTE_HOME/mattmc3/antidote)
autoload -Uz $fpath[-1]/antidote
zsh_plugins=${ZDOTDIR:-~}/.zplugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins} ]]; then
  (antidote bundle <${zsh_plugins} >${zsh_plugins}.zsh)
fi
source ${zsh_plugins}.zsh

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
bindkey -M menuselect '\r' .accept-line
bindkey -M menuselect '\e' send-break
bindkey -M menuselect '^[OD' backward-delete-char
[[ -n "${key[Home]}"     ]]  && bindkey -M menuselect "${key[Home]}"     backward-delete-char
[[ -n "${key[PageUp]}"   ]]  && bindkey -M menuselect "${key[PageUp]}"   up-history
[[ -n "${key[PageDown]}" ]]  && bindkey -M menuselect "${key[PageDown]}" down-history

bindkey  "\e\e"   backward-kill-line
bindkey  "^[[3~"  delete-char
[[ -n "${key[Home]}"     ]]  && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey "${key[End]}"  end-of-line

# local .zshrc
[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local

# zprof
