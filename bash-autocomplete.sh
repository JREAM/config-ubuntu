#!/bin/bash
AVAILABLE=(
  apm
  awless
  awscli
  bundler
  capistrano
  conda
  defaults
  dirs
  django
  drush
  export
  fabric
  gem
  gh
  git
  git_flow
  git_flow_avh
  go
  gradle
  grunt
  gulp
  homesick
  hub
  invoke
  jboss7
  jungle
  kontena
  kubectl
  makefile
  maven
  minikube
  ng
  npm
  nvm
  openshift
  packer
  pew
  pip
  pip3
  pipenv
  projects
  rake
  rvm
  salt
  sdkman
  ssh
  svn
  system
  terraform
  test_kitchen
  tmux
  todo
  travis
  vagrant
  vault
  virsh
  virtualbox
)

echo ""
echo "====================================================================="
echo "  Available Auto-completions      "
echo "  /etc/bash_completion.d/<name>"
echo "  Use spaces for multiple, eg: vault vairtualbox "
echo "---------------------------------------------------------------------"

# Easier to read output
for value in "${AVAILABLE[@]}"; do
  printf "%-8s\n" "${value}"
done | column

echo ""
echo "====================================================================="
echo ""

read -e -p "Type a Command: " cmd

# Skip Empty
# [ -z "$cmd" ] && echo "You entered nothing."; exit 1;

# Convert to array (Based on spaces)
CMD_LIST=($cmd)

# Unique List
CMD_LIST=($(echo "${CMD_LIST[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))

# Loop Unique List
for item in "${CMD_LIST[@]}"
do
  # See if in available list
  if [[ " ${AVAILABLE[@]} " =~ " ${item} " ]]; then
    echo "[+] Adding $item to /etc/bash_completion.d/$item"
    sudo curl -so /etc/bash_completion.d/$item https://raw.githubusercontent.com/Bash-it/bash-it/master/completion/available/$item.completion.bash > /dev/null
  else
    echo "[!] $item: Not found"
  fi
done
