#!/bin/bash 

varkill=false

# Process arguments
while [ $# -gt 0 ]; do
    key="$1"
    shift
    case $key in
        "-k"|"--kill")
            varkill=true
            ;;
        *)
            return 1;;
    esac
done

if ! tmux has -t=music 2>/dev/null && ! $varkill ; then
    tmux start-server
    tmux new-session -d -s music

    tmux select-window -t 0
    tmux send-keys 'cmus' C-m
elif $varkill ; then
    tmux kill-session -t=music 2>/dev/null
    exit 0
fi
tmux attach-session -t music
exit 0
