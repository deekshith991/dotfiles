function tma
    tmux new-session -A -s (test (count $argv) -gt 0; and echo $argv[1]; or echo main)
end
