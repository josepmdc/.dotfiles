function fish_title
    if [ $_ = "fish" ]
        echo $_ ' '
    else
        echo $_ ' ' (basename $PWD)
    end
end
