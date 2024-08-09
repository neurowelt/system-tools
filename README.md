# System Tools

Various scripts, tools and knowledge that help working with system processes.

## Projects

All code and materials found in this repository are generally called **projects**. Each project can be a separate script, a collection of scripts or a document.

Projects are separated simply by the language they were written in (for documents, we treat _human languages_ as a single group). 

For more detailed information about what is the current status of all the scripts in this repository and what is their purpose, feel free to check out the existing directories:
* [Bash](./bash/)

## Development

Below you will find a table of projects that are either under development or planned to be implemented in the future. These include scripts, improvements to existing scripts or the repository in general.

Each entry in the table contains the following information:
* **Name** - Name of the project (might be subject to change)
* **Type** - Type of the project (script, improvement, etc.)
* **Description** - Short description of the project purpose
* **Status** - Current status of the project development:
    * :computer: - in progress
    * :pencil2: - draft & planning
    * :stop_sign: - progress halted
    * :wastebasket: - discontinued

<br>
<div align="center">

| Name | Type | Description | Status | Branch |
|:----:|:----:|:-----------:|:------:|:------:|
| `check_cpu.sh` | Bash script | Return current information about CPU load. | :computer: | [`scripts/check_cpu`](https://github.com/neurowelt/system-tools/tree/scripts/check_cpu) |
| `check_gpu.sh` | Bash script | Return current information about GPU usage. | :pencil2: | - |

</div>
<br>

> [!NOTE]
> Do you have any ideas? Feel free to open an issue or a pull request!

## Notes

Main motivation beind this repository is to learn bash scripting and have a collection of different variety of scripts that come in handy in day to day wandering around the operating system.

Another goal is to include other programming languages and build a library of scripts that either directly interact with system processes or utilize tools gathered in this repository to achieve that interaction.
