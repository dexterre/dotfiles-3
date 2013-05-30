# ┌───────────────┬──────────────────────────────────────────────────────────┐
# │          FILE │ .zshrc                                                   │
# │   DESCRIPTION │ ZSH configuration file.                                  │
# │        AUTHOR │ DexTerre                                                 │
# │       VERSION │ 1.0.0                                                    │
# └───────────────┴──────────────────────────────────────────────────────────┘


# ┌──────────────────────────────────────────────────────────────────────────┐
# │ General Options                                                          │
# └──────────────────────────────────────────────────────────────────────────┘

# history
HISTSIZE=800
SAVEHIST=600
HISTFILE=~/.history
setopt append_history               # Add to history file, don't replace it
setopt hist_expire_dups_first       # When space needed, collect dups first
setopt hist_ignore_dups             # Don't remember consecutive dups
setopt hist_ignore_space            # Initial space means don't record

# directories
DIRSTACKSIZE=10
setopt auto_cd                      # Just type dir name, without cd
setopt auto_pushd                   # Make cd push onte dir stack
setopt pushd_ignore_dups            # Forbid multiple copies on dir stack

export TERM='xterm-256color'        # configure le terminal en 256 couleurs
export EDITOR=vim                   # use vim as an editor

# Alias management
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"           # load in ~/.aliases
fi

# no binary files for vim
zstyle ':completion:*:vim:*' ignored-patterns '*.(o|a|so|aux|dvi|log|swp|fig|bbl|blg|bst|idx|ind|out|toc|class|pdf|ps|pyc)'


# ┌───────────────┬──────────────────────────────────────────────────────────┐
# │        Prompt │ A Powerline like prompt for Bash/ZSH in 2 lines          │
# │        Source │ https://github.com/Janhouse/powerline-shell              │
# │        Source │ https://github.com/Lokaltog/powerline-fonts              │
# └───────────────┴──────────────────────────────────────────────────────────┘

CHROOT=`ls -di / | awk '{if ($1 != "2") print 1; else print 0;}'`
function powerline_precmd() {
    PREV=$?
    EXTRA=`logname`@`hostname`
    export PS1="$(~/.powerline-shell-2L/powerline-shell.py ${PREV} --width ${COLUMNS} --chroot ${CHROOT} --shell zsh --extra ${EXTRA})"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}
if [ "$TERM" != "linux" ] ; then
    install_powerline_precmd
else
    prompt walters
fi
