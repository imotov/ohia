OS=$(uname)

if [[ $OS == "Darwin" ]]; then
    PATH=$PATH:$HOME/.local/bin

    # Setup homebrew
    if [ -s "/opt/homebrew/bin/brew" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        export HOMEBREW_NO_ENV_HINTS=true
    fi

    # Setup command line utilities for VS Code
    if [ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ]; then
        export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    fi

fi
