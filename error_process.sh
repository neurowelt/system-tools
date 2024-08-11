#!/bin/bash
#
# Simple process that raises errors in a loop and randomly succeeds

funcs[0]="echo 'Success'; exit 0"
funcs[1]="echo 'Error'; exit 1"
funcs[2]="echo 'Error'; exit 1"
funcs[3]="echo 'Error'; exit 1"
funcs[4]="echo 'Error'; exit 1"

while true; do
    func=$(($RANDOM % ${#funcs[@]}))
    eval ${funcs[$func]}
    sleep 1
done
