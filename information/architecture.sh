#!/bin/bash
#
# Retrieve basic information about the machine and operating system
# Provide compatibility check for other scripts and system naming conventions

_LINUX="linux-gnu"
_MACOS="darwin"
_CYGWIN="cygwin"
_OPENBSD="openbsd"
_FREEBSD="freebsd"
_NETBSD="netbsd"
_DRAGONFLYBSD="dragonfly"
_SOLARIS="solaris"
_ANDROID="linux-android"
_HAIKU="haiku"

#######################################
# Retrieve operating system name
# Globals:
#   OSTYPE (bash built-in)
# Returns:
#   Operating system name to stdout
#######################################
get_os() {
    local os=$OSTYPE
    if [[ -z "$os" ]]; then
        os=$(uname -o)
    fi
    echo "$os"
}

#######################################
# Retrieve machine type name
# Returns:
#   Machine type name to stdout
#######################################
get_machine() {
    uname -m
}

#######################################
# Checks if script is compatible with OS
# Arguments:
#   OS name(s) to check compatibility with
#   --silence (-s) flag to suppress
# Returns:
#   Stdout message if compatible, exit 1 otherwise
#######################################
is_compatible() {
    # We require OS name passed as argument
    if [[ -z $1 ]]; then
        echo "Usage: is_compatible <os-name> <os-name-2> ... (--silent)"
        echo "Options:"
        echo "  -s, --silent: Silence all messages"
        echo "See architecture.sh for common OS names"
        exit 1
    fi

    # Parse input argumemnts
    local os_names=()
    local silent=false
    while [ $# -gt 0 ] ; do
        case $1 in
            -s | --silent)
                silent=true
                ;;
            *)
                os_names+=($1)
        esac
        shift
    done

    # Check comaptibility with each supported OS
    local is_compatible=0
    local current_os=$(get_os)
    for os_name in "${os_names[@]}"; do
        if ! [[ $silent == true ]]; then
            echo "Checking compatibility with $os_name"
            echo "Curent OS is $current_os"
        fi

        # Check name containing both ways
        echo "$os_name" | grep -q "$current_os"
        local os_to_cos=$?
        echo "$current_os" | grep -q "$os_name"
        local cos_to_os=$?
        if [[ $cos_to_os -eq 0 || $os_to_cos -eq 0 ]]; then
            is_compatible=1
            if ! [[ $silent == true ]]; then
                echo "Script is compatible"
            fi
            break
        fi
    done

    if [[ $is_compatible -eq 0 ]]; then
        # Not compatible with any of supported OS
        if ! [[ $silent == true ]]; then
            echo "Script is not compatible with current OS"
        fi
        exit 1
    fi
}

#######################################
# Main script method
# Returns:
#   Machine type and OS name to stdout
#######################################
main() {
    local os=$(get_os)
    local machine=$(get_machine)
    echo "Your machine type is: $machine"
    echo "Your operating system is: $os"
}

if [[ ${BASH_SOURCE[0]} == ${0} ]]; then
    main "$@"
fi
