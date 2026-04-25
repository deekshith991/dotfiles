function tma
    set -l session (string split / (pwd))[-1]

    if set -q argv[1]
        set session $argv[1]
    end

    tmux new-session -A -s "dev-$session"
end
