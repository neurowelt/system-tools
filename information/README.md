# Information

Projects dedicated to:
* Providing information about the system and its architecture
* Retrieving data about system components (memory, CPU/GPU, disk space, etc.)

List of projects in this directory:
* [`architecture.sh`](#architecturesh) - Return operating system and machine name, check OS compatibility

## Usage

### [`architecture.sh`](./architecture.sh)

Script that returns the operating system and machine name, as well as provides OS compatibility check function.

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
    ```
    