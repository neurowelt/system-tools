# Information

Projects dedicated to:
* Providing information about the system and its architecture
* Retrieving data about system components (memory, CPU/GPU, disk space, etc.)

List of projects in this directory:
* [`architecture.sh`](#architecturesh) - Return operating system and machine name, check OS compatibility
* [`hardware.sh`](#hardwaresh) - Return average CPU load, total and used memory 

## Usage

### [`architecture.sh`](./architecture.sh)

Script that returns the operating system and machine name, as well as provides OS compatibility check function.

General usage:
* Script:
    ```bash
    bash architecture.sh
    ```
* Import:
    ```bash
    source architecture.sh
    ```

Methods:
* `get_os` - Return operating system name
    * Returns:
        * Operating system name

* `get_machine` - Return machine name
    * Returns:
        * Machine name
* `is_compatible` - Check if the current OS is compatible with the provided list of OS names
    * Arguments:
        * `os_names` - List of OS names to check compatibility with
    * Returns:
        * `1` if the current OS is not compatible
        * Message that the OS is compatible

Use cases:
* Check your OS and machine name:

    ```bash
    bash architecture.sh
    ```

* Check if given script can be run on this OS by providing compatible OS names:

    ```bash
    #!/bin/bash

    source architecture.sh

    is_compatible "darwin" "linux"

    # Code below will run if the OS is either darwin or linux
    unix_only_method
    ```
### [`hardware.sh`](./hardware.sh)

Script that returns average CPU load, total and used memory.

General usage:
* Script:
    ```bash
    bash hardware.sh
    ```
* Import:
    ```bash
    source hardware.sh
    ```

Methods:
* `get_cpu_load` - Get average loads of the CPU (1, 5, and 15 min)
    * Returns:
        * Average CPU loads to stdout

* `get_total_memory` - Get total RAM memory size
    * Arguments:
        * `-b/k/m/g/t/p` flags for return format
        * `--si` flag for using base 1000 instead of 1024
        * `-h, --help` for printing usage and allowed formats
    * Returns:
        * Total RAM memory value to stdout
        * Exit code 1 if incompatible

* `get_used_ram_percentage` - Get percentage of used RAM memory
    * Returns:
        * Memory usage percentage to stdout
        * Exit code 1 if incompatible

* `main` - Main script method
    * Returns:
        * Current average CPU loads
        * Current percentage of memory used
        * Current memory used in GB

Use cases:
* Check current CPU load and memory usage:

    ```bash
    bash hardware.sh
    ```

* Get total memory in megabytes using SI units:

    ```bash
    #!/bin/bash

    source hardware.sh

    get_total_memory --si -m
    ```

* Get used RAM percentage:

    ```bash
    #!/bin/bash
    
    source hardware.sh
    
    get_used_ram_percentage
    ```