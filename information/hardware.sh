#!/bin/bash
#
# This script checks current memory and CPU usage

if ! [[ -f "architecture.sh" ]]; then
    echo "architecture.sh file is required to use this script."
fi

source architecture.sh

#######################################
# Get average loads of the CPU (1, 5 and 15 min)
# Returns:
#   Average loads to stdout
#######################################
get_cpu_load() {
    uptime | grep -o 'load average[s]*: .*' | grep -o '[0-9.]\+'
}

#######################################
# Get percentage of used RAM memory on MacOS
# Returns:
#   Memory in percentage to stdout
# Source:
#   https://apple.stackexchange.com/questions/81581/
#######################################
get_used_ram_percentage_macos() {
    # Gather pages values & size
    local pages=()
    pages[0]="Pages active"
    pages[1]="Pages wired down"
    pages[2]="Pages speculative"
    pages[5]="Pages occupied by compressor"
    pages[6]="File backed pages"

    macos_pagesize=$(pagesize)
    total_mem=$(sysctl -n hw.memsize)
    accum_mem=0

    # Calculate accumualted used memory
    for el in "${pages[@]}"
    do
        mem=$(vm_stat | grep "$el")
        IFS=: read -r name value <<< "$mem"
        value=$((${value%?}))
        accum_mem=$(($accum_mem + $value * $macos_pagesize))
    done

    echo $(( $accum_mem * 100 / $total_mem))
}

#######################################
# Get percentage of used RAM memory
# Returns:
#   Memory in percentage to stdout, exit 1 if incompatible
#######################################
get_used_ram_percentage() {
    # First check compatibility
    (is_compatible $_LINUX --silent)
    local is_linux=$?
    (is_compatible $_MACOS --silent)
    local is_macos=$?

    # Check memory accordingly
    local memory_stat=""
    if [[ $is_linux -eq 0 ]]; then
        memory_stat=$(free --si | awk 'NR==2{printf "%.2f", $3*100/$2}')
    elif [[ $is_macos -eq 0 ]]; then
        memory_stat=$(get_used_ram_percentage_macos)
    fi

    if [[ -z $memory_stat ]]; then
        # No checks for this architecture
        local your_arch=$(get_os)
        echo "No memory checks provided for your architecture ($your_arch)"
        exit 1
    else
        echo $memory_stat
    fi
}


#######################################
# Main script method
# Returns:
#   Current average CPU loads
#######################################
main() {
    echo "Current CPU load (1, 5, 15 min):"
    get_cpu_load
    echo ""
    echo "Current percentage of memory used:"
    get_used_ram_percentage
}

if [[ ${BASH_SOURCE[0]} == ${0} ]]; then
    main "$@"
fi
