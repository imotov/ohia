OS=$(uname)

if [[ $OS == "Linux" ]]; then
  PATH=$PATH:$JAVA_HOME/bin:/home/igor/.local/bin
  PYENV_ROOT="$HOME/.pyenv"
  PATH="$PYENV_ROOT/bin:$PATH"
  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
  fi

  # Setup node.js virtual environment manager
  if [ -s "$HOME/.nvm/nvm.sh" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  fi

  # Setup SDKMAN
  if [ -d "$HOME/.sdkman" ]; then
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
  fi

  # Setup Conda
  if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    export PATH="$HOME/miniconda3/bin:$PATH"
    source "$HOME/miniconda3/etc/profile.d/conda.sh"
  fi

  # Setup CMake (from ~/.local/bin if installed there)
  if [ -f "$HOME/.local/bin/cmake" ]; then
    export PATH="$HOME/.local/bin:$PATH"
  fi

  # Setup CUDA Toolkit
  if [ -d "/usr/local/cuda" ]; then
    export PATH="/usr/local/cuda/bin:$PATH"
    export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
  fi

fi
