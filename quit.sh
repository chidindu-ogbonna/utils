# this shell scripts all my tmux processses and if possible shutsdown the
# computer 
quit_cmus () {
    exec "cmus"
    if [ $? != 0 ]; then
        exec cmus-remote -s
     else 
         exec cmus-remote -s
    return
}
quit_cmus
