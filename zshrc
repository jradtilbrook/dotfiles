# Path to your oh-my-zsh installation.
ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    artisan
    aws
    composer
    docker
    docker-compose
    fzf
    git
    gpg-agent
    kubectl
    last-working-dir
    sudo
    zsh-aws-vault
)

# User configuration

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# do not kill background processes on exit
setopt NO_HUP

# dont store `history` commands
setopt HIST_NO_STORE

# Catppuccin-macchiato fzf theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

# fd - cd to selected directory
fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# laravel helpers
routes() {
    if [ $# -eq 0 ]
    then
        artisan route:list -r --ansi | fzf --ansi
    else
        artisan route:list | rg ${1}
    fi
}

# check out main or master
gsm() {
    if git branch -a | rg -q main
    then
        git switch main $@
    else
        git switch master $@
    fi

}

# Aliases
alias art=artisan
compdef _artisan_add_completion art
alias cat='bat --theme="Catppuccin-macchiato"'
alias ls='eza --long --header --git'
alias la='ls -a'
alias sc='sesh connect "$(sesh list -i | gum filter --limit 1 --placeholder "Pick a sesh" --prompt="⚡")"'
alias t=tmux
alias tl='tmux list-sessions'
alias tink='artisan tinker'
alias v=nvim
alias vimdiff='nvim -d'
alias tree='eza --tree --color=always'

# Initialise starship prompt
eval "$(starship init zsh)"

eval "$(zoxide init zsh --cmd cd)"

# Herd injected PHP binary.
export PATH="/Users/jradtilbrook/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/jradtilbrook/Library/Application Support/Herd/config/php/82/"


# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="/Users/jradtilbrook/Library/Application Support/Herd/config/php/81/"


# Herd injected PHP 7.4 configuration.
export HERD_PHP_74_INI_SCAN_DIR="/Users/jradtilbrook/Library/Application Support/Herd/config/php/74/"


# Herd injected PHP 8.0 configuration.
export HERD_PHP_80_INI_SCAN_DIR="/Users/jradtilbrook/Library/Application Support/Herd/config/php/80/"


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/jradtilbrook/Library/Application Support/Herd/config/php/83/"


# Herd injected NVM configuration
export NVM_DIR="/Users/jradtilbrook/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"


# Herd injected PHP binary.
export PATH="/Users/jradtilbrook/Library/Application Support/Herd/bin/":$PATH
