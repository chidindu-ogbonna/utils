#!/bin/bash


# This is used to change the theme of I my i3 setup 
# works with i3-style

change_theme () {
    echo -n " :: Enter the theme >>> "
    read choosen_theme
    i3-style $choosen_theme -o ~/.config/i3/config --reload 
    return 0
}

echo -n " Do you need a list of themes? [Y/n] "
read answer
if [ "$answer" = "Y" ]; then
    i3-style -l
    echo " :: Select your theme from the list of themes!"
    change_theme
else
    change_theme
fi
