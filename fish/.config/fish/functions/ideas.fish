function ideas
    set name $argv[1]

    if test -z "$name"
        echo "Usage: ideas <name>"
        return 1
    end

    set dir "$HOME/notes/ideas/"
    set file "$dir/$name.md"

    mkdir -p $dir

    if not test -f $file
        printf "# %s\n\n" $name >$file
    end

    nvim $file
end
