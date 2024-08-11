#!/bin/bash
#
# Run given process in a loop and restart on errors
# Process is run until this process is interrupted or the child process succeeds

echo "Warning: This script runs indefinitely until exit code is 0."
echo "Simple interruption will stop it (Ctrl+C)."

#######################################
# Runs given command and restarts it until finish
# Arguments:
#   Command to run with arguments
# Returns:
#   Process stdout & stderr, exit 0 on success
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
            exit 0
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
