# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=~/.npm-global/bin:$PATH
# export PATH=/home/amjerm/node_modules/.bin:$PATH
# export PATH=./vendor/bin:$PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH

DOCKER_ENV_PATH="/home/amjerm/repos/tsi/docker"

# Path to your oh-my-zsh installation.
export ZSH="/home/amjerm/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
ZSH_CUSTOM=~/zsh_custom

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# default fzf options
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

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

# Set Spaceship ZSH as a prompt
autoload -Uz promptinit && promptinit
prompt spaceship

# Enabling ZSH git autocomplete
autoload -Uz compinit && compinit

function gac() {
  git add -A
  git commit -m "$1"
}

function jqa() {
  sh ~/Scripts/jira/qa_ready.sh "$@"
}

function jip() {
  for ticket in $(echo $1 | sed "s/,/ /g")
  do
    jira start "$ticket"
    jira assign "$ticket"
  done
  echo ""
  jira jql current
}

function aur() {
  xdg-open "https://aur.archlinux.org/packages/?O=0&K=$@"
}

#. $HOME/repos/packages/z/z.sh

## Aliases
alias weather="curl 'wttr.in/?m&format=%t' && curl 'wttr.in/?u&format=%t+%o+%p+%S+%s+%m+%M'"
alias weatherdetail="curl v2d.wttr.in"

alias lasttags="echo 'LARAVEL' && git --git-dir=$DOCKER_ENV_PATH/repos/laravel/.git ld && echo '' && echo 'wordpress' && git --git-dir=$DOCKER_ENV_PATH/repos/wordpress/.git ld"

alias jc="jira jql current"
alias ja="jira jql all"
alias js="jira show"
alias dt="echo -n 'local\t' && date '+%Y-%m-%d %T' && echo -n 'utc\t' && date -u '+%Y-%m-%d %T'"

alias please="sudo !!"

alias checkstaging="python ~/Scripts/gitlab/checkStaging.py"
alias chst="checkstaging"

function whichstaging() {
  defaultThreshold=10
  threshold=${1:-$defaultThreshold}
  checkstaging staging1,staging2,staging3,staging4,staging005,staging6,staging7,staging8 $threshold
}

alias wst="whichstaging"

alias resetTouchpad="sudo rmmod i2c_i801 && sudo modprobe i2c_i801"

function runDiff() {
  git fetch -q && git diff --name-status origin/master origin/$1
}

function buildDiff() {
  echo -e "Laravel\n=======" > ~/diff.txt
  cd $DOCKER_ENV_PATH/repos/laravel
  runDiff $1 >> ~/diff.txt
  cd -
  echo -e "\n" >> ~/diff.txt
  echo -e "Wordpress\n=========" >> ~/diff.txt
  cd $DOCKER_ENV_PATH/repos/wordpress
  runDiff $1 >> ~/diff.txt
  cd -
  cat ~/diff.txt
}

function showDiff() {
  cat ~/diff.txt
}

# git helpers
function gitBranchByString() {
  git branch | grep $1
}
alias gbbs="gitBranchByString"

function gitBranchByRegex() {
  git branch | grep -E $1
}
alias gbbr="gitBranchByRegex"

function gitBranchByReverseRegex() {
  git branch | grep -E -v $1
}
alias rgbbr="gitBranchByReverseRegex"

function gitCheckoutByString() {
  git checkout $(gitBranchByString $1)
}
alias gcbs="gitCheckoutByString"

# Onivim2 AppImage
alias oni2="${HOME}/AppImages/Onivim2-x86_64-master.AppImage"

JIRA_CONFIG="/home/amjerm/.jira-cli/config.json"
AMJERM_CONFIG="/home/amjerm/repos/amjerm/config-files"

alias evim="$EDITOR $AMJERM_CONFIG/.vimrc"
alias etmux="$EDITOR $AMJERM_CONFIG/.tmux.conf"
alias ezsh="$EDITOR $AMJERM_CONFIG/.zshrc"
alias ewez="$EDITOR $AMJERM_CONFIG/wezterm.lua"
alias emutt="$EDITOR ~/.mutt/muttrc"
alias enotes="cd ~/repos/amjerm/notes && nvim ."
alias ejira="$EDITOR ~/.jira-cli/config.json"
alias practiceVim="$EDITOR ~/repos/amjerm/vim-practice"

alias reset="source ~/.zshrc"

alias td="todoist"
alias nvide="neovide"
# alias edit=$EDITOR
alias dbclient=$DBCLIENT
alias lararavelDB="dex laravel-db && mysql laravel"
alias mail="neomutt"

alias backupHome='sh /home/amjerm/Scripts/backup-home.sh'

# TMUX
alias tsp='tmux split-window -p'
alias tkp='tmux kill-pane'

alias elight='sudo nvim /sys/class/backlight/amdgpu_bl0/brightness'

cd && clear && neofetch
# echo 'vpn';protonvpn s
