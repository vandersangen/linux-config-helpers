# k8s related
alias k=kubectl

source <(kubectl completion zsh)  # set up autocomplete in zsh into the current shell
echo '[[ $commands[kubectl] ]] && source <(kubectl completion zsh)' >> ~/.zshrc # add autocomplete permanently to your zsh shell

# Other
arm() {
  arch -x86_64 $@
}


# SSH related
_ssh()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    hosts=()
    while IFS= read -r line; do
        hosts+=( "$line" )
    done < <(grep '^Host' ~/.ssh/config | grep -v '[?*]' | cut -d ' ' -f 2-)
    compadd -X 'Available ssh hosts:' -a hosts
    return 0
}
compdef _ssh ssh
compdef _ssh scp
compdef _ssh ssh-copy-id
