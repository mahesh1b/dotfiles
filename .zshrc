# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting aws terraform)

#kubectl autocompletion
autoload -Uz compinit
compinit
source <(kubectl completion zsh)

# DuploToken
asure_sandbox_token() {
  export duplo_token=$(duplo-jit duplo --host https://duplo.sandbox.ewagrit.asuresoftware.com --interactive | jq -r '.DuploToken')
}

nb_kaw(){
  netbird down
  netbird up --management-url https://netbird.dev.krisatwork.ai:33073 --admin-url https://netbird.dev.krisatwork.ai
}

nbdc(){
  netbird down
}
# Put individual kubeconfig files in ~/.kube/custom-contexts dir
# Function to append all kubeconfig files in the "config" directory to KUBECONFIG
init_kubeconfig() {
    local kubeconfig_dir="$HOME/.kube/custom-contexts"
    local kubeconfigs="$HOME/.kube/config"

    for file in "$kubeconfig_dir"/*; do
        if [ -f "$file" ]; then
            kubeconfigs="$kubeconfigs:$file"
        fi
    done

    # Remove the leading colon if any files were found
    if [ -n "$kubeconfigs" ]; then
        kubeconfigs="${kubeconfigs#:}"
        export KUBECONFIG="${KUBECONFIG:+$KUBECONFIG:}$kubeconfigs"
    fi
}

source $ZSH/oh-my-zsh.sh

export PATH=/Users/mahesh/.local/bin:$PATH
export SPACESHIP_AWS_SYMBOL="  "
init_kubeconfig
# Example aliases
alias tf=terraform
alias k=kubectl
alias speedtest='wget -O /dev/null http://speed.transip.nl/100mb.bin'
alias ls='eza -lah --no-time --icons --git --group-directories-first --no-permissions'
alias ld='eza -lahD --no-time --icons --git --no-permissions --no-filesize'
alias vim=nvim
