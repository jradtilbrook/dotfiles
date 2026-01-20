UNAME="$(uname)"

if [ "$UNAME" = "Darwin" ]; then
    export HERD_PHP_83_INI_SCAN_DIR="/Users/jradtilbrook/Library/Application Support/Herd/config/php/83/"
    export HERD_PHP_84_INI_SCAN_DIR="/Users/jradtilbrook/Library/Application Support/Herd/config/php/84/"
    export HERD_PHP_85_INI_SCAN_DIR="/Users/jradtilbrook/Library/Application Support/Herd/config/php/85/"

    # Herd injected NVM configuration
    export NVM_DIR="/Users/jradtilbrook/Library/Application Support/Herd/config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

    [[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

    # Herd injected PHP binary.
    export PATH="/Users/jradtilbrook/Library/Application Support/Herd/bin/":$PATH
fi
