#!/bin/bash
#
# This script checks current memory and CPU usage

#######################################
# Get average loads of the CPU (1, 5 and 15 min)
# Returns:
#   Average loads to stdout
#######################################
get_cpu_load() {
    uptime | grep -o 'load average[s]*: .*' | grep -o '[0-9.]\+'
}

#######################################
# Main script method
# Returns:
#   Current average CPU loads
#######################################
main() {
    echo "Current CPU load (1, 5, 15 min)"
    get_cpu_load
}

if [[ ${BASH_SOURCE[0]} == ${0} ]]; then
    main "$@"
fi
