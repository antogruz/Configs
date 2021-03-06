fpath=( /Users/agruzelle/.zshscripts $fpath )
#
# Path to your oh-my-zsh installation.
export ZSH=/Users/agruzelle/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="blinks"
#ZSH_THEME="random"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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
#plugins=(z git colored-man zsh-syntax-highlight )

# User configuration

export PATH="/usr/lib/ccache"
export PATH=$PATH:"/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:/Users/agruzelle/bin:/Users/agruzelle/mybin:/Users/agruzelle/scripts"

source $ZSH/oh-my-zsh.sh
#source ~/.zsh/zsh-vcs-prompt/zshrc.sh
#ZSH_VCS_PROMPT_ENABLE_CACHING='true'
#RPROMPT='$(vcs_super_info)'

bindkey -v
bindkey "^P"  history-beginning-search-backward
bindkey "^N"  history-beginning-search-forward
bindkey '^r'  history-incremental-search-backward

export KEYTIMEOUT=1
export CLICOLOR=1

export SVN_EDITOR=gvim

alias ctags="`brew --prefix`/bin/ctags"
alias m='make -j8'
alias mktags='ctags -R .'
alias clojure='java -jar clojure-1.8.0.jar'
alias gvim='gvim -O'

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
function softdiff() {
if [ -z $2 ]
then
	vimdiff ~/Travail/soft_enc/$1 ~/Travail/soft_dec/$1;
else
	vimdiff ~/Travail/soft_enc/$1 ~/Travail/soft_dec/$2
fi
}

alias ctags=/usr/local/Cellar/ctags/5.8_1/bin/ctags

export JAVA_HOME=/Library/Java/JavaVirtualMachines/sfdc-openjdk_11.0.4.jdk/Contents/Home

. /Users/agruzelle/mybin/z.sh
