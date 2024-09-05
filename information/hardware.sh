#!/bin/bash
#
# This script checks current memory and CPU usage

if ! [[ -f "architecture.sh" ]]; then
    echo "architecture.sh file is required to use this script."
    exit 1
fi

source architecture.sh

###
# Get average loads of the CPU (1, 5 and 15 min)
# Returns:
#   Average loads to stdout
###
get_cpu_load() {
    uptime | grep -o 'load average[s]*: .*' | grep -o '[0-9.]\+'
}

###
# Get total RAM memory size
# Args:
#   -b/k/m/g/t/p flags for size return format
#   --si flag for using base 1000 instead of 1024
#   -h, --help for printing usage and allowed formats
# Returns:
#   Total RAM memory value to stdout, exit 1 if incompatible
###
get_total_memory() {
    # First check compatibility
    (is_compatible $_LINUX --silent)
    local is_linux=$?
    (is_compatible $_MACOS --silent)
    local is_macos=$?

    # Parse input argumemnts
    local memory_args=()
    while [ $# -gt 0 ] ; do
        case $1 in
            -h | --help)
                echo "Usage: get_total_memory (-b/k/...) (--si)"
                echo "Options:"
                echo "-b            show output in bytes"
                echo "-k (--si)     show output in kibi(kilo)bytes"
                echo "-m (--si)     show output in mebi(mega)bytes"
                echo "-g (--si)     show output in gibi(giga)bytes"
                echo "-t (--si)     show output in tebi(tera)bytes"
                echo "-p (--si)     show output in pebi(peta)bytes"
                echo "--si          use powers of 1000 not 1024 (e.g. 1000 is kilo, 1024 is kibi)"
                exit 0
                ;;
            *)
            memory_args+=($1)
        esac
        shift
    done
    if [[ -z $memory_args ]]; then
        memory_args=("-b")
    fi

    # Check memory accordingly
    local total_memory=""
    if [[ $is_linux -eq 0 ]]; then
        total_memory=$(free ${memory_args[0]} ${memory_args[1]} | awk 'NR==2{printf $2}')
    elif [[ $is_macos -eq 0 ]]; then
        local format_power=0
        local format_base=1024
        for arg in "${memory_args[@]}"; do
            case $arg in
                -k)
                    format_power=1
                    ;;
                -m)
                    format_power=2
                    ;;
                -g)
                    format_power=3
                    ;;
                -t)
                    format_power=4
                    ;;
                -p)
                    format_power=5
                    ;;
                --si)
                    format_base=1000
                    ;;
            esac
        done
        local awk_statement='{print $1/('$format_base'^'$format_power')}'
        total_memory=$(sysctl -n hw.memsize | awk "$awk_statement")
    fi

    if [[ -z $total_memory ]]; then
        # No checks for this architecture
        local your_arch=$(get_os)
        echo "No total memory check provided for your architecture ($your_arch)"
        exit 1
    else
        echo $total_memory
    fi
}

###
# Calculate the size of used RAM memory on MacOS
# Returns:
#   Memory in percentage to stdout
# Source:
#   https://apple.stackexchange.com/questions/81581/
###
calculate_accum_memory_macos() {
    # Gather pages values & size
    local pages=()
    pages[0]="Pages active"
    pages[1]="Pages wired down"
    pages[2]="Pages speculative"
    pages[5]="Pages occupied by compressor"
    pages[6]="File backed pages"

    macos_pagesize=$(pagesize)
    accum_mem=0

    # Calculate accumualted used memory
    for el in "${pages[@]}"
    do
        mem=$(vm_stat | grep "$el")
        IFS=: read -r name value <<< "$mem"
        value=$((${value%?}))
        accum_mem=$(($accum_mem + $value * $macos_pagesize))
    done

    echo $accum_mem
}

###
# Get percentage of used RAM memory
# Returns:
#   Memory in percentage to stdout, exit 1 if incompatible
###
get_used_ram_percentage() {
    # First check compatibility
    (is_compatible $_LINUX --silent)
    local is_linux=$?
    (is_compatible $_MACOS --silent)
    local is_macos=$?

    # Check memory accordingly
    local memory_stat=""
    if [[ $is_linux -eq 0 ]]; then
        memory_stat=$(free | awk 'NR==2{printf "%.2f", $3*100/$2}')
    elif [[ $is_macos -eq 0 ]]; then
        local accum_mem=$(calculate_accum_memory_macos)
        local total_mem=$(get_total_memory)
        memory_stat=$(($accum_mem * 100 / $total_mem))
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

###
# Main script method
# Returns:
#   Current average CPU loads
###
main() {
    printf "Current CPU load (1, 5, 15 min):\n$(get_cpu_load)\n\n"
    printf "Current percentage of memory used:\n$(get_used_ram_percentage)\n\n"
    printf "Display current memory used in GB:\n"
    echo $(get_total_memory --si -g)
}

if [[ ${BASH_SOURCE[0]} == ${0} ]]; then
    main "$@"
fi
