# Defaults
export SHELL=/bin/zsh

source ~/.zinit/bin/zinit.zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Expansion and Globbing
setopt extended_glob # treat #, ~, and ^ as part of patterns for filename generation

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

fpath=(/usr/local/share/zsh-completions $fpath)

###############################################################################
# History
###############################################################################

setopt inc_append_history # Append history as commands are executed
setopt hist_ignore_all_dups # Don't save duplicates
setopt hist_save_no_dups
setopt extended_history
setopt hist_reduce_blanks
setopt hist_verify hist_fcntl_lock
setopt auto_cd

unsetopt share_history # Disable sharing history between terminals (sessions)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

###############################################################################
# completion
###############################################################################
setopt nolistbeep # could be nobeep, but that will create cases where there is no repsone at all to a <tab>
# Do menu-driven completion.
zstyle ':completion:*' menu select

# make file completion match ls colors - this now done by trapd00r/LS_COLORS
#zstyle ':completion:*' list-colors $LS_COLORS

# formatting and messages
# http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
zstyle ':completion:*' extra-verbose yes
# describe different versions of completion. Test with: cd<tab>
zstyle ':completion:*:descriptions' format "%F{yellow}--- %d%f"
zstyle ':completion:*:messages' format '%d'
# when no match exists. Test with: cd fdjsakl<tab>
zstyle ':completion:*:warnings' format "%F{red}No matches for:%f %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
# groups matches. Test with cd<tab>
zstyle ':completion:*' group-name ''
# this will only show up if a parameter flag has a name but no description
zstyle ':completion:*' auto-description 'specify: %d'
# this should make completion for some commands faster, haven't noticed though. saves in .zcompcache
zstyle ':completion::complete:*' use-cache 1

########################################
# Theme and plugins #
########################################

COMPLETION_WAITING_DOTS="true"
zinit wait'0a' lucid blockf for zsh-users/zsh-completions

export ZSH_AUTOSUGGEST_USE_ASYNC=1
# for match_prev_cmd to work, it requires histignorealldups to be removed (which is ok: do histsavenodups instead)
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
zinit wait'0' lucid atload"!_zsh_autosuggest_start" for zsh-users/zsh-autosuggestions

zinit wait'1' lucid for supercrabtree/k

zinit ice wait'1' lucid light-mode for lukechilds/zsh-better-npm-completion
zinit wait'1' atclone'./zplug.zsh' lucid for g-plane/zsh-yarn-autocompletions

if [ ! -x "$(command -v dircolors)" ]; then
  alias dircolors=gdircolors
fi
# add LOTS of file type colors
zinit wait'1' atclone"dircolors -b LS_COLORS > clrs.zsh" \
atpull'%atclone' pick"clrs.zsh" nocompile'!' \
atload'zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"' \
lucid light-mode for trapd00r/LS_COLORS

###############################################################################
# fzf
###############################################################################

if [ -x "$(command -v fdfind)" ]; then
  # alternate name used on ubuntu/debian
  export FD=fdfind
else
  export FD=fd
fi

# fuzzy completion: ^R, ^T, ⌥C, **
export FZF_DEFAULT_COMMAND="$FD --type file"
export FZF_DEFAULT_OPTS='--height 30% --layout=reverse'
export FZF_TMUX_OPTS="-d 70%"
FZF=fzf
export FZF_ALT_C_COMMAND='$FD --type directory'
export FZF_ALT_C_OPTS="--preview 'CLICOLOR_FORCE=1 ls -GF {} | head -200' --preview-window=right:20%"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
if [ -x "$(command -v bat)" ]; then
  export FZF_CTRL_T_OPTS="--preview 'bat --color always {} | head -120' --preview-window=right:33%"
fi
zinit wait'1' lucid as'null' \
  atinit"[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh && bindkey 'ç' fzf-cd-widget #option-c" light-mode for zdharma-continuum/null

# history search has to be loaded aftr fzf, so that it overwrites ^R
if [[ -x $(command -v atuin) ]]; then
  zinit wait'1' lucid light-mode atinit"bindkey '^xr' history-search-multi-word" for zdharma-continuum/history-search-multi-word
  export ATUIN_NOBIND="true"
  zinit wait"1" lucid light-mode atinit"bindkey '^r' _atuin_search_widget" for ellie/atuin
else
  zinit wait'1' lucid for zdharma-continuum/history-search-multi-word
fi

# list programs to generate completions for here
zstyle :plugin:zsh-completion-generator programs fzf
zinit wait'2' lucid atclone'if [ ! -d "$GENCOMPL_FPATH" ]; then
  mkdir -p $GENCOMPL_FPATH
fi' for RobSis/zsh-completion-generator

zinit wait'1' lucid atclone'source fzf-tab.zsh && build-fzf-tab-module' atpull'%atclone' for Aloxaf/fzf-tab
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -l --blocks name,permission,size,date --color=always --icon=always $realpath'
zstyle ':fzf-tab:complete:ls:*' fzf-preview '[ -f "$realpath" ] && bat --color=always $realpath || lsd -l --blocks name,permission,size,date --color=always --icon=always $realpath'
zstyle ':fzf-tab:complete:export:*' fzf-preview 'printenv $word'
zstyle ':fzf-tab:complete:ssh:*' fzf-preview 'ping -c1 $word'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

if [ -x "$(command -v bat)" ]; then
# this MUST be run after woefe/git-prompt.zsh
  alias cat=bat
  # this function does not work for piping to less with (less) arguments (any flags will become bat flags)
  function less() {
    local filename="${@:$#}" # last parameter, MUST be the filename
    local flaglength=$(($# - 1))
    if ((flaglength > 0)); then
      local other="${@:1:$flaglength}"
      bat $filename --pager "less $LESS $other"
    elif ((flaglength == 0)); then
      bat $filename --pager "less $LESS"
    else
    # no arg at all -> piping
      command less
    fi
  }
fi
if [ -x "$(command -v lsd)" ]; then
  alias ls=lsd
  alias ll='ls -l --date relative --blocks permission,size,date,name'
fi

###############################################################################

setopt promptsubst

zinit wait'1' lucid for \
    OMZL::git.zsh \
    OMZL::functions.zsh \
    OMZL::directories.zsh\
    OMZP::git

if hash kubectl 2>/dev/null; then
  zinit wait'1' lucid for atload"unalias k" OMZP::kubectl
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  zinit ice svn
  zinit snippet OMZP::macos
fi

zinit wait'1' lucid light-mode for "cedi/meaningful-error-codes"

zinit wait'1' lucid atinit'alias f=fuck' light-mode for laggardkernel/zsh-thefuck

zinit wait'1' lucid as"completion" light-mode for nilsonholger/osx-zsh-completions

zinit wait'2' lucid atload'ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(autopair-insert)' light-mode for hlissner/zsh-autopair

zinit lucid light-mode for agkozak/zsh-z

zinit wait'2' lucid --atinit="ZINIT[COMPINIT_OPTS]=-C; zicompinit; autoload -U +X bashcompinit && bashcompinit; zicdreplay" --atload="fast-theme XDG:improved-default >> /tmp/fast-theme.log" light-mode for zdharma-continuum/fast-syntax-highlighting

# zsh-notify (as opposed to zbell) only notifies when the pane with the command is not focused
# icons (whether remote or local) affects performance noticably
# silent because zsh-notify does not work on raspberry pi
notification_command_complete_timeout=30
zinit wait'0' silent atload'
zstyle ":notify:*" command-complete-timeout $notification_command_complete_timeout
zstyle ":notify:*" enable-on-ssh yes
zstyle ":notify:*" error-icon "https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Blokkade.png/240px-Blokkade.png"
zstyle ":notify:*" error-sound "Sosumi"
zstyle ":notify:*" error-title "⛔️ errored in #{time_elapsed}"
zstyle ":notify:*" success-icon "https://upload.wikimedia.org/wikipedia/commons/a/a6/Green_approved.png"
zstyle ":notify:*" success-sound "Blow"
zstyle ":notify:*" success-title "✅ finished in #{time_elapsed}"' \
for marzocchi/zsh-notify

# set up a bell after command that run longer than this many seconds (regardless of focus or result)
if [[ -n $UNAME_LINUX ]]; then
zbell_duration=$notification_command_complete_timeout
else
# on macOS zsh-notify is generally better
zbell_duration=600
fi
zbell_ignore+=($EDITOR $PAGER vim code less bat cat man run-help lnav)
zinit wait'0' lucid for OMZP::zbell

# exa doesn't download well on WSL
# zinit wait'0' lucid as"program" from"gh-r" mv"exa* -> exa" pick"$ZPFX/exa" light-mode for ogham/exa
export TIME_STYLE=long-iso
if [ -x "$(command -v exa)" ]; then
  function x() {
    command exa -F --color-scale --group-directories-first --color=always --icons -x $*
    }
  function xl() {
    command exa -F --color-scale --group-directories-first --color=always --icons -l $* | command less -r
  }
else
  alias x=l
  alias xl=ll
fi

##################
# Custom Aliases #
##################

[ -f ~/.config/zsh/aliases ] && . ~/.config/zsh/aliases

########################################
# Directories to be prepended to $PATH #
########################################

export GOPATH=~/go

declare -a dirs_to_prepend
dirs_to_prepend=(
  "/usr/local/opt/openssl/bin"
  "/usr/local/sbin"
  "/usr/local"
  "$HOME/bin"
  "$GOPATH/bin"
  "$HOME/go/bin"
  "/usr/local/go/bin"
)

# Explicitly configured $PATH
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

for dir in ${(k)dirs_to_prepend[@]}
do
  if [ -d ${dir} ]; then
    # If these directories exist, then prepend them to existing PATH
    PATH="${dir}:$PATH"
  fi
done

unset dirs_to_prepend

export PATH

######################
# User configuration #
######################

if [[ "$OSTYPE" == "darwin"* ]]; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi
fi

export DEPS_AWS_CONFIG_PATH="~/.aws/config"
export DEPS_AWS_PROFILE="default"

export SS_ANALYTICS_TUNNEL_USERNAME=lostrowski
export SS_TUNNEL_USERNAME=lostrowski
export SS_ANALYTICS_TUNNEL_KEY_FILENAME=id_rsa

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lukaszostrowski/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lukaszostrowski/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lukaszostrowski/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lukaszostrowski/google-cloud-sdk/completion.zsh.inc'; fi

export NPM_AUTH_TOKEN="ee25a6015f97db39fa648645083147b1669b0757"

if hash complete 2>/dev/null; then
  complete -o nospace -C /usr/local/bin/terraform terraform
fi

eval "$(starship init zsh)"
