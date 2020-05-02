log() {
  echo >&2 "[~/.zshrc] $(tput setaf 245)$*$(tput sgr0)"
}

brew() {
  sudo chown -R "$(whoami)" /usr/local/bin /usr/local/etc /usr/local/sbin /usr/local/share /usr/local/share/doc
  chmod u+w /usr/local/bin /usr/local/etc /usr/local/sbin /usr/local/share /usr/local/share/doc
  command "brew" $@
}
