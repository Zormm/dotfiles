if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting ''
end

# export PATH="$HOME/.local/bin:$PATH"
# export PATH="$HOME/bun/bin:$PATH"

fish_add_path "$HOME/.bun/bin"
fish_add_path "$HOME/.local/bin"

zoxide init fish | source
alias cd='z'
