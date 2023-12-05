# Set the default shell to zsh
export SHELL=/bin/zsh

# Enable Powerline fonts for a better terminal appearance
source /usr/share/powerlevel10k/powerlevel10k.zsh-theme

# Set the prompt theme
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)

# Add directories to the PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set the default editor
export EDITOR="nano"

# Enable command auto-correction
setopt correct

# Enable syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Customize aliases
alias ll='ls -l'
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'
alias kd='kubectl get pods'

# Customize the appearance of ls command
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"

# Add other custom configurations...
