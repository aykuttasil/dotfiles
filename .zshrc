# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="false"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git bundler dotenv macos colored-man-pages encode64 gitignore urltools)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# Load custom functions
if [[ -f "$HOME/dotfiles/zsh_functions.inc" ]]; then
	source "$HOME/dotfiles/zsh_functions.inc"
else
	echo >&2 "WARNING: can't load shell functions"
fi

# Load custom aliases
if [[ -f "$HOME/dotfiles/zsh_aliases.inc" ]]; then
	source "$HOME/dotfiles/zsh_aliases.inc"
else
	echo >&2 "WARNING: can't load shell aliases"
fi

# Add zsh completion scripts installed via Homebrew
fpath=("$HOMEBREW_PREFIX/share/zsh-completions" $fpath)
fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)

# Reload the zsh-completions
autoload -U compinit && compinit -i

# load zsh plugins installed via brew
if [[ -d "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting" ]]; then
	source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
if [[ -d "$HOMEBREW_PREFIX/share/zsh-autosuggestions" ]]; then
	source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi


# Android Configuration
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_PLATFORM_TOOLS="$ANDROID_HOME/platform-tools"
export ANDROID_TOOLS="$ANDROID_HOME/build-tools/32.0.0/"
export ANDROID_CMDLINE="$ANDROID_HOME/cmdline-tools/latest/tools/bin"
export ANDROID_EMULATOR="$ANDROID_HOME/emulator"

PATH="$PATH:$ANDROID_PLATFORM_TOOLS:$ANDROID_TOOLS:$ANDROID_EMULATOR:$ANDROID_CMDLINE"


# Dart
# PATH="$PATH":"$HOME/.pub-cache/bin"


# Flutter
PATH="$PATH:$HOME/flutter/bin"


# Ruby
#PATH="/opt/homebrew/opt/ruby/bin:$PATH"
#export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
#export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

# if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
#   PATH=/opt/homebrew/opt/ruby/bin:$PATH
#   PATH=`gem environment gemdir`/bin:$PATH
# fi

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# # zsh parameter completion for the dotnet CLI
# _dotnet_zsh_complete()
# {
#   local completions=("$(dotnet complete "$words")")

#   reply=( "${(ps:\n:)completions}" )
# }
# compctl -K _dotnet_zsh_complete dotnet


# zsh parameter completion for the dotnet CLI

_dotnet_zsh_complete() 
{
  local completions=("$(dotnet complete "$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}

compdef _dotnet_zsh_complete dotnet

# compctl -K _dotnet_zsh_complete dotnet
PATH="$PATH:$HOME/.dotnet/tools"


# pyenv for Python
if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi

# The Fuck
eval $(thefuck --alias)


export JAVA_HOME=$(/usr/libexec/java_home)

export PATH















# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


## [Completion] 
## Completion scripts setup. Remove the following line to uninstall
# [[ -f /Users/aykutasil/.dart-cli-completion/zsh-config.zsh ]] && . /Users/aykutasil/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

