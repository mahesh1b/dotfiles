# Alias
alias tf=terraform
alias vim=nvim
alias k=kubectl

# Enable colors and change prompt:
autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

export KUBECONFIG=~/.kube/custom/asure-prod.yaml:~/.kube/custom/cr-nonprod:~/.kube/custom/cr-prod:~/.kube/custom/gep-nonprod:~/.kube/custom/asure-mgmt-eks:~/.kube/custom/asure-uat.yaml:~/.kube/custom/fortuna-prod.yaml:~/.kube/custom/fortuna-uat.yaml:~/.kube/custom/grit-sandbox.yaml:~/.kube/custom/asure-sandbox.yaml:~/.kube/custom/fortuna-sandbox.yaml:~/.kube/custom/grit-prod.yaml:~/.kube/custom/grit-uat.yaml

#kubectl autocompletion
autoload -Uz compinit
compinit
source <(kubectl completion zsh)

source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh-history-substring-search/zsh-history-substring-search.zsh

# Pure
autoload -U promptinit; promptinit
prompt pure

# pokemon
pokemon-colorscripts -r --no-title
