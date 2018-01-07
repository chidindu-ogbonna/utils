#!/bin/bash

# Automating a tmux environment

code_session () {
    cd ~/Code
    echo -n "Enter the name of the session (project in lowercaps) >>> "
    read SESSION_NAME
    echo -n "Be sure this is correct: $SESSION_NAME (y/n) >>>"
    read RESPONSE
    if [ "$RESPONSE" = "y" ]; then
        tmux has-session -t "$SESSION_NAME"
        if [ $? != 0 ]; then
            tmux new-session -s "$SESSION_NAME" -n code -d
            # tmux send-keys -t 1 "nvim" C-m
            # don't want the program to start
            tmux send-keys -t 1 "nvim"
            tmux new-window -n music
            tmux send-keys -t 1 "cmus" C-m
            tmux new-window -n test1
            tmux split-window -h
        else
            tmux attach-session -t "$SESSION_NAME"
        fi
    elif [ "$RESPONSE" = "n" ]; then
        code_session
    fi
    return
}

start_tmux_session () {
    echo -n "coding or bloging (c/b) >>> "
    read ANSWER
    if [ "$ANSWER" = "b" ]; then
        cd ~/Code/GitHub/bones97.github.io
        tmux has-session -t blog
        # the exit status indicates 0 is succesful and >0 is failed
        # therfore if not true do this
        if [ $? != 0 ]; then
            tmux new-session -s blog -n blog -d
            tmux send-keys -t 1 "nvim" C-m
            tmux new-window -n music
            tmux send-keys -t 1 "cmus" C-m
            tmux new-window -n extra
            tmux split-window -h
        else
            tmux attach-session -t blog
        fi
    elif [ "$ANSWER" = "c" ]; then
        code_session
    else
        # recalling the function again
        start_tmux_session
    fi
    return
}
tmux start-server
start_tmux_session
