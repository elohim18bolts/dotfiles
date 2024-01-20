
# The following lines were added by compinstall

zstyle ':completion:*' completer _list _expand _complete _ignored _match _approximate
zstyle ':completion:*' file-sort name
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle :compinstall filename '/home/elohim/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=30000
setopt autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
#
ZSH_PLUGIN_DIR=~/.nix-profile/share
source $ZSH_PLUGIN_DIR/fzf-tab/fzf-tab.plugin.zsh
source $ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(kubectl completion zsh)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "/usr/share/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
eval "$(starship init zsh)"
export TERM=xterm
export EDITOR=nvim
export SUDO_EDITOR=nvim
export SYSTEMD_EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"
export SERVER_MAC="48:21:0b:51:bc:eb"
fpath=(~/Documents/dotfiles/zsh_completions $fpath)
fpath=($ZSH_PLUGIN_DIR/zsh/site-functions $fpath)
#ssh-agent config
eval $(keychain --eval --quiet ${$(find ~/.ssh -iname "*.pub")%.pub})
alias ls="ls --color"
alias grep="grep --color"
alias k="kubectl"
alias gin="git init"
alias gic="git commit"
alias gad="git add"
alias gpo="git push origin"


########PATH#######
export PATH="$HOME/go/bin:$HOME/.local/bin:/var/lib/snapd/snap/bin:$PATH"
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then source $HOME/.nix-profile/etc/profile.d/nix.sh; fi



#neofetch

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix


