# System Tools

Various system level scripts and tools that allow for easier working with system processes.

## Scripts

In the table below you will find short descriptions of all available scripts and an information whether:
* **Runnable** - Is this script runnable, i.e. does it do anything meaningful when `bash`ed?
* **Modular** - Can this script be imported for its methods into other scripts?
* **Standalone** - Is this script runnable as a standalone process, i.e. it does not require other scripts to be used? (_see note below the table for more information on exceptions_)

<br>

| Script | Description | Runnable | Modular | Standalone |
|:------:|:-----------:|:--------:|:-------:|:----------:|
| `architecture.sh` | Return operating system and machine name. | :white_check_mark: | :white_check_mark: | :white_check_mark: |

> Most of the scripts will contain a method from `architecture.sh` script called `is_compatible`. It is placed at the beginning of the script to indicate on which platform the script was confirmed to successfully run. This method does not count into the **Standalone** category criteria.

## Development

Below you will find a table of scripts and improvements that are either under development or planned to be implemented in the future.

Each entry in the table contains the following information:
* **Script** - Name of the script (might be subject to change)
* **Description** - Short description of the script's purpose
* **Status** - Current status of the script development:
    * :computer: - Script is under development
    * :pencil2: - Script is planned to be developed
    * :stop_sign: - Script's development has been halted
    * :wastebasket: - Script has been discarded

<br>

| Script | Description | Status | Branch |
|:------:|:-----------:|:------:|:------:|
| `check_cpu.sh` | Return current information about CPU load. | :computer: | [`scripts/check_cpu`](https://github.com/neurowelt/system-tools/tree/scripts/check_cpu) |
| `check_gpu.sh` | Return current information about GPU usage. | :pencil2: | - |

Do you have any ideas? Feel free to open an issue or a pull request!

## Notes

Main motivation beind this repository is to learn bash scripting and have a collection of different variety of scripts that come in handy in day to day wandering around the operating system.

Convention followed in this repository aims to be as consistent with [Google's bash scripting convention](https://google.github.io/styleguide/shellguide.html) as possible. If you find any inconsistencies, feel encouraged to open an issue.
