#! /bin/bash

get_os() {
    echo "$(uname -o)"
}

get_machine() {
    echo "$(uname -m)"
}

main() {
    os=$(get_os)
    machine=$(get_machine)
    echo "Your machine type is: $machine"
    echo "Your operating system is: $os"
}

if [[ ${BASH_SOURCE[0]} == ${0} ]]; then
    main "$@"
fi
