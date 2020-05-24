# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/aykutasil/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="random"
ZSH_THEME_RANDOM_CANDIDATES=("robbyrussell" "af-magic" "jbergantine" "jnrowe")

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages docker docker-compose encode64 gitignore urltools)

source $ZSH/oh-my-zsh.sh

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

###########


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

# Homebrew install path customization
export HOMEBREW="$HOME/.homebrew"
if [ ! -d "$HOMEBREW" ]; then
	# fallback
	export HOMEBREW=/usr/local
fi

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

PATH="$HOMEBREW/bin:$HOMEBREW/sbin:$PATH"

# Add zsh completion scripts installed via Homebrew
fpath=("$HOMEBREW/share/zsh-completions" $fpath)
fpath=("$HOMEBREW/share/zsh/site-functions" $fpath)

# Reload the zsh-completions
autoload -U compinit && compinit -i


# iTerm2 integration
# if [ -e "${HOME}/.iterm2_shell_integration.zsh" ]; then
#  source "${HOME}/.iterm2_shell_integration.zsh"
# else
#  log "WARNING: skipping loading iterm2 shell integration"
# fi


# load zsh plugins installed via brew
if [[ -d "$HOMEBREW/share/zsh-syntax-highlighting" ]]; then
	source "$HOMEBREW/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
if [[ -d "$HOMEBREW/share/zsh-autosuggestions" ]]; then
	# source "$HOMEBREW/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi


# GCloud Configuration
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi


# python: replace system python
PATH="$HOMEBREW/opt/python/libexec/bin:$PATH"

# Flutter Configuration
PATH="$HOME/flutter/bin:$PATH"

# Java Configuration
# For the system Java wrappers to find this JDK, symlink it with
#  sudo ln -sfn $HOME/.homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
PATH="$HOME/.homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/$HOME/.homebrew/opt/openjdk/include"


# Android Configuration
PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
PATH="$HOME/Library/Android/sdk/cmdline-tools/latest/bin:$PATH"
PATH="$HOME/Library/Android/sdk/emulator:$PATH"


# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet
PATH="$HOME/.dotnet/tools:$PATH"



export PATH 


