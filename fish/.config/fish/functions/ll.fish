function ll --wraps='eza -l --color=always --group-directories-first --icons' --wraps='ls -lah' --description 'alias ll ls -lah'
    ls -lah $argv
end
