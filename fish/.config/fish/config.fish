source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
~/.local/try.rb init ~/src/tries | source

# # Start a new agent if the current one is invalid
# if not set -q SSH_AUTH_SOCK; or not test -S "$SSH_AUTH_SOCK"
#     eval (ssh-agent -c)
# end
#
# # Add key if agent has no identities
# ssh-add -l >/dev/null 2>&1
# or ssh-add ~/.ssh/github_cachy_loq


# tuxedo config
set -x TODO_DIR "$HOME/notes"
set -x TODO_FILE "$TODO_DIR/todo.txt"
set -x DONE_FILE "$TODO_DIR/done.txt"
