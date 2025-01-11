alias tf=terraform
alias vim=nvim
alias k=kubectl

# k8s default editor
export KUBE_EDITOR="nvim"

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

# Enable colors and change prompt:
autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

export KUBECONFIG=~/.kube/custom/t2z-infra-eks:~/.kube/custom/cybrilla-sandbox:~/.kube/custom/cybrilla-internal:~/.kube/custom/asure-prod.yaml:~/.kube/custom/cr-nonprod:~/.kube/custom/cr-prod:~/.kube/custom/gep-nonprod:~/.kube/custom/asure-mgmt-eks:~/.kube/custom/asure-uat.yaml:~/.kube/custom/fortuna-prod.yaml:~/.kube/custom/fortuna-uat.yaml:~/.kube/custom/grit-sandbox.yaml:~/.kube/custom/asure-sandbox.yaml:~/.kube/custom/fortuna-sandbox.yaml:~/.kube/custom/grit-prod.yaml:~/.kube/custom/grit-uat.yaml

#kubectl autocompletion
autoload -Uz compinit
compinit
source <(kubectl completion zsh)

source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh-history-substring-search/zsh-history-substring-search.zsh

# Pure
PURE_GIT_DOWN_ARROW=
PURE_GIT_UP_ARROW=
autoload -U promptinit; promptinit
prompt pure

# pokemon
pokemon-colorscripts -r --no-title | fastfetch --file-raw -
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
