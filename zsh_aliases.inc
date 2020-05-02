# This script is sourced from .zshrc.

alias c='pbcopy'
alias p='pbpaste'
alias c.='code .'
alias code.='code .'


# cloud stuff
alias d='docker'
alias dr='docker run --rm -i -t'
alias dx='docker exec -i -t'
alias db='docker build -t'



alias ffmpeg='docker run --rm -i -t -v $PWD:/tmp/workdir jrottenberg/ffmpeg'
alias youtube-dl='docker run --rm -i -t -v $PWD:/data vimagick/youtube-dl'
