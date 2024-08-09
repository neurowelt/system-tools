#!/bin/bash
#
# Run given process in a loop and restart on errors
# Process is run until this process is interrupted or the child process succeeds

#######################################
# Runs given command and restarts it until finish
# Arguments:
#   Command to run with arguments
# Returns:
#   Process stdout & stderr
#######################################
restart_process() {
    if [[ -z $1 ]]; then
        echo "Usage: restart_process <command> <args>"
        exit 1
    fi
    local exit_code=0
    while true; do
        "$@"
        exit_code=$?
        if [[ $exit_code -eq 0 ]]; then
            echo "Process completed successfully with exit code $exit_code."
            break
        else
            echo "Process crashed with exit code $exit_code. Restarting..."
            sleep 1
        fi
    done
}

#######################################
# Main script method
#######################################
main() {
    restart_process "$@"
}

if [[ ${BASH_SOURCE[0]} == ${0} ]]; then
    main "$@"
fi
