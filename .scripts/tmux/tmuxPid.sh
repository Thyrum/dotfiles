#!/bin/bash

pidList=''

for pid in $(tmux list-panes -a -F "#{pane_pid} #{session_name}" | grep $1 | cut -d ' ' -f 1 | tr '\n' ' '); do
    newPids=$(pstree -pl $pid | sed 's/[^0-9][^0-9]*(/ /g' | tr -d ')\n')
    pidList="$pidList$newPids"
done

echo "${pidList#?}"
