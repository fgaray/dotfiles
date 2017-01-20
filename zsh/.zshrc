#{{{Opciones generales


#espera 10 segundos si vamos a borrar todo
setopt RM_STAR_WAIT

#no hay beeps en los errores
unsetopt beep nomatch

zstyle :compinstall filename '/home/felipe/.zshrc'

#Vi mode
bindkey -v

bindkey -s '^B' 'run-compile\n'
bindkey -s '^N' 'run-test\n'
bindkey -s '^K' 'run-compile && run-test\n'

#Case insensitive globbing
setopt NO_CASE_GLOB

#titulo de las tabs
zstyle ':omz:terminal' auto-title 'yes'

#Globs extendidos como cp ^*.(tar|bz2|gz). 
setopt extendedglob

#}}}

#{{{Historial
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory notify

#evitamos que se guarden los duplicados
setopt hist_ignore_all_dups
#}}}



#{{{Autocompletado
autoload -Uz compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

#corregimos los errores al escribir comandos
setopt correctall 

#Completado mas rapido
zstyle ':completion::complete:*' use-cache 1

#MENU EN EL COMPLETADO!
zstyle ':completion:*:default' menu 'select=0'


#}}


#Activamos los colores
autoload -U colors && colors


autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn


#{{{ Editor por defecto es vim, si es que esta instalado
if [[ -x $(which vim) ]]
then
	export EDITOR="vim"
	export USE_EDITOR=$EDITOR
	export VISUAL=$EDITOR
fi
#}}}




#{{{ Muestra el modo en vi mode
function zle-line-init zle-keymap-select {
RPS1="${${KEYMAP/vicmd/(N)}/(main|viins)/(I)}"
RPS2=$RPS1
zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
#}}}





prompt_gentoo_setup () {


	prompt_gentoo_prompt=${1:-'blue'}
	prompt_gentoo_user=${2:-'green'}
	prompt_gentoo_root=${3:-'red'}

	if [ "$USER" = 'root' ]
	then
		base_prompt="%B%F{$prompt_gentoo_root}%m:%k "
	else
		base_prompt="%B%F{$prompt_gentoo_user}%k"
	fi
	post_prompt="%b%f%k"

	#setopt noxtrace localoptions

	path_prompt="%B%F{$prompt_gentoo_prompt}%~"
	PS1="┌┤$base_prompt$path_prompt$reset_color|  $post_prompt 
└╼ "
	PS2="$base_prompt$path_prompt %_> $post_prompt"
	PS3="$base_prompt$path_prompt ?# $post_prompt"
}

prompt_gentoo_setup "$@"


#}}}

#{{{ ALIAS

alias netbeans='/usr/local/netbeans-8.0/bin/netbeans'

#youtube-dl
alias youtube_baja='youtube-dl -t -f 5 -c'
alias youtube_normal='youtube-dl -f 34 -t -c'

#git
alias push='git push origin master'
alias push='git pull origin master'
alias vimlog='git log -p  | view - -R -c "set foldmethod=syntax"'

#comandos
alias grep='grep --color=auto'
alias mutt='mutt -y'

alias mplayer='mplayer -vo xv -vsync'

#sudo
alias please='sudo'

#haskell
alias clear_haskell='rm *.hi'

#mata el proceso que esta usando mas RAM
alias killmem="kill -9 $(ps aux | sort +3 -4 -g | awk '{ FIELD = $2}; END { print FIELD}')"

# Para tener 256 colores en tmux
#alias tmux="TERM=xterm-256color tmux -2"

alias scons="scons -j 4"
#alias make="make -j 4"
alias halt="sudo poweroff"

alias mac="ssh 158.170.35.22"

alias citiaps2="ssh felipe@158.170.35.88"


# Otros
alias prou="cd $HOME/programacion/u/"
alias pronu="cd $HOME/programacion/u/"
alias usb="sudo mount /dev/sdb1 /mnt"
alias windows="sudo mount /dev/sda2 /media/windows/; cd /media/windows"
alias proxy="ssh -D 8080 root@haskmell.ddns.net"

## Radio
alias radio="mplayer 'http://senalclasica.radiousach.cl:8080/RadioClasica?MSWMExt=.asf'"


## Capslock
alias set_caps_lock="setxkbmap -option caps:escape"
xmodmap ~/.Xmodmap 2>> /dev/null


alias docker="sudo docker"
alias rmc="sudo docker rm"

alias serve='twistd -no web --path=.'
alias fm='ranger'
alias scp='scp -C'

sudo hdparm -B 255 /dev/sda > /dev/null
alias hdparm="sudo hdparm -B 255 /dev/sda > /dev/null"

alias ls='ls -X --color=auto --group-directories-first'

# No corregimos
alias vim="nocorrect vim"
alias task="nocorrect task"
alias ghci="nocorrect ghci"
alias stack="nocorrect stack"


alias fix-display="export DISPLAY=$(ps aux | grep Xorg | grep usr | awk '{ print $14}')"

alias arduino-monitor='echo "sallir con C-A C-Q"; sudo picocom -b 9600 /dev/ttyACM0'

alias sendmail="msmptq -r"

alias run-compile=make
alias run-test='make test'

alias hdfs='sudo mount -t nfs -o vers=3,proto=tcp,nolock,noacl,sync 192.168.0.105:/ /mnt'

alias vpn="sudo openvpn --config /home/felipe/Downloads/client.ovpn"

alias java7="sudo update-alternatives --set java /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java"

alias java8="sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java"

alias clone="git clone --depth=1"

alias gen-pass="apg -a 1 -m 6 -x 10 -M NCL -c /dev/urandom"


#}}}

PATH=/home/felipe/Downloads/node-v5.5.0-linux-x64/bin/:/home/felipe/Downloads/scala-2.11.6/bin/:$HOME/programacion/u/pingeso/gradle-2.1/bin:$HOME/bin:$HOME/.cabal/bin:/home/felipe/Downloads/android-sdk-linux/tools/:/home/felipe/Downloads/android-sdk-linux/platform-tools/:/opt/cisco/anyconnect/bin/:/home/felipe/.local/bin/:$PATH



### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

### Para android
#export ANDROID_HOME=/home/felipe/Downloads/android-sdk-linux

#export XDG_CONFIG_HOME="$HOME/.config"

#export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")

#export LIBCPPSIM_ROOT=/home/felipe/Downloads/libcppsim-0.2.5/

################################## FUNCIONES ###################################


### Funciones
## unregister broken GHC packages. Run this a few times to resolve dependency rot in installed packages.
# ghc-pkg-clean -f cabal/dev/packages*.conf also works.
function ghc-pkg-clean() {
for p in `ghc-pkg check $* 2>&1 | grep problems | awk '{print $6}' | sed -e 's/:$//'`
do
echo unregistering $p; ghc-pkg $* unregister $p
done
}
 
# remove all installed GHC/cabal packages, leaving ~/.cabal binaries and docs in place.
# When all else fails, use this to get out of dependency hell and start over.
function ghc-pkg-reset() {
echo 'erasing directories under ~/.ghc'; rm -rf `find ~/.ghc -maxdepth 1 -type d`
echo 'erasing ~/.cabal/lib'; rm -rf ~/.cabal/lib
# echo 'erasing ~/.cabal/packages'; rm -rf ~/.cabal/packages; 
# echo 'erasing ~/.cabal/share'; rm -rf ~/.cabal/share; 
}


function encriptar() {
    openssl aes-256-cbc -in $1 -out $1
}

function desencriptar() {
    openssl aes-256-cbc -d -in $1
}

function get_passwd_for() {
  desencriptar db/pass.csv.enc | grep $1
}


function hgrep() {
  cat $HOME/.histfile | uniq | grep -a $1
}


function yplay {
  # play <song-name>

   $HOME/youtube/youtube-dl --default-search=ytsearch: \
              --youtube-skip-dash-manifest \
              --output="${TMPDIR:-/tmp/}%(title)-s%(id)s.%(ext)s" \
              --restrict-filenames \
              --format="bestaudio[ext!=webm]" \
              --exec=mplayer -vvv "$*"
}


function sus {
  sudo umount $HOME/nfs
  sudo swapon -a && sudo s2disk && sudo hdparm -B 255 /dev/sda
  sudo swapoff -a
}


function rmac {
  sudo docker stop $1
  sudo docker rm $1
} 


function git-latexdiff {
  # git-latexdiff branch1
  
  if [ "$#" -ne 1 ]
  then
    echo "Usage: git-latexdiff ORIGINAL_BRANCH"
    return 0
  fi

  CURRENT=$(git rev-parse --abbrev-ref HEAD)
  git stash
  git checkout $1
  latexpand informe.tex > informe_viejo.tex
  git checkout $CURRENT
  git stash pop
  latexpand informe.tex > informe_nuevo.tex
  latexdiff -e utf8 informe_viejo.tex informe_nuevo.tex > diff.tex
  #latexmk diff.tex
}

function gcall {
  # Clean everything not tracked and ignored
  git clean -fn
  echo "Continue (y/n)?"
  read choice
  case "$choice" in
    y|Y) git clean -f && git clean -fX;;
    * ) echo "Not removing";;
  esac
}


function captura {
  echo "Esperando 5 segundos..."
  sleep 5s && import -window root $1
}


function mount-ssh {
  # TODO: Detectar si es la red local, en caso de que sea entonces montar sin
  # compresion y usando la ip local
  sshfs root@192.168.0.105:/ nfs -o reconnect
}


function md2docx {
  NO_EXTENSION=${1%.*}
  pandoc -s $NO_EXTENSION.md  --from=markdown --to=docx -o $NO_EXTENSION.docx
}


function md2pdf {
  NO_EXTENSION=${1%.*}
  pandoc $NO_EXTENSION.md --latex-engine=xelatex -o $NO_EXTENSION.pdf
}

function find-file {
  find . -iname "*$1*"
}

function mars-cli {
  java -jar $HOME/Documentos/U/orga/ayudantia/Mars4_5\(1\).jar smc $1
}

function git-recuperar {
# Argumentos: $1: file-path
  git checkout $(git rev-list -n 1 HEAD -- $1) -- $1
}


function reset-pulse {
    sudo kill -9 $(pgrep pulseaudio)
}

source $HOME/.zsh_alias/task_warrior.sh


################################## FIN FUNCIONES ###############################



# OPAM configuration
. /home/felipe/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
