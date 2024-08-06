#! /bin/bash

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

get_os() {
    # Retrieve the operating system name
    local os=$OSTYPE
    if [[ -z "$os" ]]; then
        os=$(uname -o)
    fi
    echo "$os"
}

get_machine() {
    # Retrieve machine type
    echo "$(uname -m)"
}

is_compatible() {
    # Return an information if given script is compatible with current OS
    # We require OS name passed as argument
    if [[ -z $1 ]]; then
        echo "Usage: is_compatible <os-name> <os-name-2> ..."
        exit 1
    fi

    # Check comaptibility with each supported OS
    local is_compatible=0
    for os_name in "$@"; do
        current_os=$(get_os)
        echo "Checking compatibility with $os_name"
        echo "Curent OS is $current_os"

        # Check name containing both ways
        echo "$os_name" | grep -q "$current_os"
        local os_to_cos=$?
        echo "$current_os" | grep -q "$os_name"
        local cos_to_os=$?
        if [[ $cos_to_os -eq 0 || $os_to_cos -eq 0 ]]; then
            is_compatible=1
            echo "Script is compatible"
        fi
    done

    if [[ $is_compatible -eq 0 ]]; then
        # Not compatible with any of supported OS
        echo "Script is not compatible with current OS"
        exit 1
    fi
}

main() {
    local os=$(get_os)
    local machine=$(get_machine)
    echo "Your machine type is: $machine"
    echo "Your operating system is: $os"
}

if [[ ${BASH_SOURCE[0]} == ${0} ]]; then
    main "$@"
fi
