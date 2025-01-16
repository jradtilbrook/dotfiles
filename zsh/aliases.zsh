alias v=nvim
alias vimdiff='nvim -d'
alias t=tmux
alias cat=bat
alias sc='sesh connect "$(sesh list -i | gum filter --no-strip-ansi --limit 1 --placeholder "Pick a sesh" --prompt="⚡")"'
alias tree='eza --tree --color=always'
alias kx='kubectx'

# aws-vault plugin alias clashes with av binary (aviator)
unalias av
alias awv='aws-vault'
