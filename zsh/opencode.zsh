# OpenCode configuration

# Load opencode completions
eval "$(opencode completion)"

# Alias for opencode
alias oc='opencode'

# Enable completion for the alias
compdef _opencode_yargs_completions oc
