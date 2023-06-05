arm() {
  arch -x86_64 $@
}

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
