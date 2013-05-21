# load our own completion functions
# fpath=(~/.zsh/completion $fpath)

export TERM='xterm-256color'

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# bring in history options from oh-my-zsh
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

setopt hist_verify
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first

setopt hist_ignore_space

setopt SHARE_HISTORY
setopt APPEND_HISTORY

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
# setopt CORRECT CORRECT_ALL

# colorful ls completion
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=0;32:*.jpe=0;32:*.jpeg=0;32:*.gif=0;32:*.bmp=0;32:*.pbm=0;32:*.pgm=0;32:*.ppm=0;32:*.tga=0;32:*.xbm=0;32:*.xpm=0;32:*.tif=0;32:*.tiff=0;32:*.png=0;32:*.eps=0;32:*.mpg=0;32:*.mpeg=0;32:*.avi=0;32:*.fli=0;32:*.gl=0;32:*.dl=0;32:*.xcf=0;32:*.xwd=0;32:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.flac=01;35:*.m4a=01;35:*.mpc=01;35:*.o=01;33:*.c=01;35:*.m=01;35:*.h=01;35:*.rb=01;35:*.pl=01;35:*.py=01;35:*.sh=01;35:*.m=01;35:*akefile=0;35:*tags=01;32:*~=01;30:*.swp=01;30:*README=01;31:*README.*=01;31:*readme=00;31:*.tex=01;31:*.htm=01;31:*.html=01;31:*.pdf=00;31:*.PDF=00;31:*.ps=00;31:*.PS=00;31:*.png=00;31:*.PNG=00;31:*.jpg=00;31:*.JPG=00;31:*.jpeg=00;31:*.JPEG=00;31:';
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# no binary files for vim
zstyle ':completion:*:vim:*' ignored-patterns '*.(o|a|so|aux|dvi|log|swp|fig|bbl|blg|bst|idx|ind|out|toc|class|pdf|ps|pyc)'

# tar files
zstyle ':completion:*:tar:*' files '*.tar|*.tgz|*.tz|*.tar.Z|*.tar.bz2|*.tZ|*.tar.gz'

