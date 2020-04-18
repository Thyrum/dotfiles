#!/bin/bash 
shopt -s extglob

session=""
varkill=false

# Process arguments
while [ $# -gt 0 ]; do
    key="$1"
    shift
    case $key in
        "-k"|"--kill")
            varkill=true
            ;;
        !(-*))
            if [ -z "$session" ]; then
                session=$key
            else
                return 1
            fi
            ;;
        *)
            return 1;;
    esac
done


# Check if path valid
if [ -d "$UNI/$session" ] && [ ! -z "$session" ] ; then
    # Kill existing session
    if $varkill ; then
        tmux has -t=$session 2>/dev/null && tmux kill-session -t=$session
        return 0
    fi

    # if session does not exist yet, create it. Else attach
    if ! tmux has -t=$session ; then
        cd $UNI/$session/

        tmux start-server
        tmux new-session -d -s $session

        tmux select-window -t 0
        # print the current branch and origin
        tmux send-keys 'clear; echo -e "Current branch: \033[1;32m$(git branch | grep \* | cut -d " " -f2)\033[0m
Remote origin : \033[1;32m$(git remote get-url origin)\033[0m"' C-m

		# setup second window with clock and panes
        tmux new-window -t $session:1
        tmux split-window -h -p 25
        tmux clock-mode
        tmux split-window -v -p 80

        # setup htop
        tmux send-keys 'htop --user=$USER' C-m
        tmux select-pane -t 0
        tmux send-keys 'git pull; clear' C-m

#while :; do tmux send-keys -t prt/pt1:1.2 'htop -p$(muxify pid $(tmux display-message -p "#S") | tr " " ",")' C-m; sleep 10; tmux send-keys -t prt/pt1:1.2 'q'; done

        # go back to main window
        tmux select-window -t 0
    fi
    tmux attach-session -t $session
    exit 0
else
    echo "\"$UNI/$session/\" is not a valid project directory"
    exit 1
fi
