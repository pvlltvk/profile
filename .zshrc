# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion-kubectl"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

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

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    plugins=(git docker systemd kubectl pyenv helm tekton)
elif [[ "$OSTYPE" == "darwin"* ]]; then
    plugins=(git docker macos brew pyenv kubectl helm tekton)
else
    plugins=(git)
fi

source $ZSH/oh-my-zsh.sh

# User configuration
export GOPATH='/Users/mad89/Work/go'

export PATH=$HOME/bin:/usr/local/bin:$GOPATH/bin:$HOME/Library/Python/3.9/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# When using sudo, use alias expansion (otherwise sudo ignores your aliases)
alias sudo='sudo '

# Color listing

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    eval $(dircolors ~/.dir_colors)
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    alias l='ls -lha --color'
    alias ll='ls -lha --color'
    alias la='ls -lAh --color'
    alias sl=ls # often screw this up
    alias ls='ls --color'

elif [[ "$OSTYPE" == "darwin"* ]]; then
    eval $(gdircolors ~/.dir_colors)
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    alias l='gls -lha --color'
    alias ll='gls -lha --color'
    alias la='gls -lAh --color'
    alias sl=gls # often screw this up
    alias ls='gls --color'

elif [[ "$OSTYPE" == "freebsd"* ]]; then
    eval $(gdircolors ~/.dir_colors)
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    alias l='gls -lha --color'
    alias ll='gls -lha --color'
    alias la='gls -lAh --color'
    alias sl=gls # often screw this up
    alias ls='gls --color'
fi

# mc with xoria256 theme
alias mc='mc -S solarized'

echo -e "\033];$(hostname)\007"

#Some additional aliases for kubectl
alias kctx="kubectx"
alias kns="kubens"
alias kgnow='kubectl get no -L node_pool,failure-domain.beta.kubernetes.io/zone -o wide'
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Add mitogen support for ansible
export ANSIBLE_STRATEGY=mitogen_linear
export ANSIBLE_STRATEGY_PLUGINS=/usr/local/lib/python3.9/site-packages/ansible_mitogen/plugins/strategy

autoload -U compinit; compinit

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/Users/mad89/yandex-cloud/path.bash.inc' ]; then source '/Users/mad89/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/Users/mad89/yandex-cloud/completion.zsh.inc' ]; then source '/Users/mad89/yandex-cloud/completion.zsh.inc'; fi

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"

# pyenv initializing
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
