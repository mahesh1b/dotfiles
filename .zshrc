# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship" #"robbyrussell"
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search aws terraform) 
source $ZSH/oh-my-zsh.sh
# Example aliases
alias tf=terraform
alias vim=nvim
alias k=kubectl
alias cat=bat
alias cd=z
alias speedtest="wget -O /dev/null http://speed.transip.nl/100mb.bin"
alias ls=eza
alias l="eza -lah --no-time --icons --git --group-directories-first --no-permissions"
alias ld="eza -lahD --no-time --icons --git --no-permissions --no-filesize"
alias rain="python3 Desktop/playground/rainfall/source/rainfall.py green"

# for zxoide bin
export PATH="$PATH:/Users/mahesh/.local/bin"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# k8s default editor
export KUBE_EDITOR="nvim"
export KUBECONFIG=~/.config/kubectx/cr-prod.yaml:~/.config/kubectx/cr-nonprod.yaml:~/.config/kubectx/gep-nonprod.yaml:~/.config/kubectx/grit-uat.yaml:~/.config/kubectx/grit-prod.yaml:~/.config/kubectx/grit-sandbox.yaml:~/.config/kubectx/myfortuna-uat.yaml:~/.config/kubectx/myfortuna-prod.yaml:~/.config/kubectx/myfortuna-sandbox.yaml:~/.config/kubectx/asure-uat.yaml:~/.config/kubectx/asure-prod.yaml:~/.config/kubectx/asure-sandbox.yaml:~/.config/kubectx/t2z.yaml

# FZF Latte 
export FZF_DEFAULT_OPTS=" \
--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
--color=marker:#7287fd,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39 \
--color=selected-bg:#bcc0cc \
--multi"

#kubectl autocompletion
autoload -Uz compinit
compinit
source <(kubectl completion zsh)

# DuploToken
asure_sandbox_token() {
  export duplo_token=$(duplo-jit duplo --host https://duplo.sandbox.ewagrit.asuresoftware.com --interactive | jq -r '.DuploToken')
}
asure_prod_token() {
  export duplo_token=$(duplo-jit duplo --host https://duplo.prod.ewagrit.asuresoftware.com --interactive | jq -r '.DuploToken')
}
fortuna_sandbox_token() {
  export duplo_token=$(duplo-jit duplo --host https://duplo.sandbox.myfortuna.com --interactive | jq -r '.DuploToken')
}
fortuna_prod_token() {
  export duplo_token=$(duplo-jit duplo --host https://duplo.prod.myfortuna.com --interactive | jq -r '.DuploToken')
}
grit_sandbox_token() {
  export duplo_token=$(duplo-jit duplo --host https://duplo.sandbox.gritfinancial.org --interactive | jq -r '.DuploToken')
}
grit_prod_token() {
  export duplo_token=$(duplo-jit duplo --host https://duplo.prod-apps.gritfinancial.org --interactive | jq -r '.DuploToken')
}

eval "$(zoxide init zsh)"
export SPACESHIP_AWS_SYMBOL="  "
