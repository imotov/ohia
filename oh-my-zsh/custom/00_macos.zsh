OS=$(uname)

if [[ $OS == "Darwin" ]]; then
    PATH=$PATH:$HOME/.local/bin

    # Setup homebrew
    if [ -s "/opt/homebrew/bin/brew" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        export HOMEBREW_NO_ENV_HINTS=true
    fi

    # Setup node.js virtual environment manager
    if [ -s "$HOME/.nvm/nvm.sh" ]; then
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    fi

    # Setup command line utilities for VS Code
    if [ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ]; then
        export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    fi

    if /usr/libexec/java_home 1>/dev/null 2>&1; then
        export JAVA_HOME=`/usr/libexec/java_home -v21`
        export ES_JAVA_HOME="$JAVA_HOME"
    fi

    if [ -d "/Applications/IntelliJ IDEA CE.app/Contents/MacOS" ]; then
        export PATH=$PATH:"/Applications/IntelliJ IDEA CE.app/Contents/MacOS"
    fi

    # Setup rustup
    if [ -s "$HOME/.cargo/bin" ]; then
        export PATH="$PATH:$HOME/.cargo/bin"
    fi

fi
