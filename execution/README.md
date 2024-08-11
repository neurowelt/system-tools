# Execution

Projects dedicated to:
* Executing and controlling execution of processes
* Affecting running processes

List of projects in this directory:
* [`restart_process.sh`](#restart_processsh) - Run process and restart it if it exits with an error

## Usage

### [`restart_process.sh`](./restart_process.sh)

Script that runs a process and restarts it if it exits with an error.

General usage:
```bash
bash restart_process.sh <process> <args>
```

Methods:
* `restart_process` - Run process and restart it if it exits with an error
    * Arguments:
        * `process` - Process to run
        * `args` - Arguments for the process
    * Returns:
        * Message(s) with exit code of the `process`

Use cases:
* Restart until success from terminal:
    
    ```bash
    bash restart_process.sh bash error_process.sh
    ```

    or

    ```bash
    bash restart_process.sh python error_process.py
    ```

* Restart until success in a script:

    ```bash
    source restart_process.sh

    restart_process bash error_process.sh
    ```
