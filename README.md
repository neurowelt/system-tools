# System Tools

Make your work with system processes easier and more enjoyable!

## Overview

> [!IMPORTANT]
> This repository is in it's early stage and under active development. Please expect changes to it's structure :construction:

Repository contains various scripts, tools and knowledge that help working with system processes.

All code and materials found in this repository are generally called **projects**. Each project can be a separate script, a collection of scripts or a document.

Projects are separated into directories based on their purpose. Each directory contains it's own introductory `README.md` file that provides a brief overview of its contents and more detailed information about the usage of each project.

In the table below you will find a list of all directories and a short description of the purpose that contained projects have in common.

<br>
<div align="center">

| Directory | Purpose |
|:---------:|:-----------:|
| [`information`](./information/) | Retrieving information about the system and its components (memory, CPU/GPU, disk space, etc.) |
| [`execution`](./execution/) | Executing, controlling and affecting processes |

</div>
<br>

> [!NOTE]
> Interested in helping out the repository grow? Check out the [Contributing](#contributing) section for details :blush:

## Projects

In the table below you will find short descriptions of all completed projects and the following information about them:
* **Name** - Name of the project (either denotes single script, document or a collection)
* **Type** - Type of the project (script, document, etc.)
* **Description** - Short description of the project purpose
* **Languages** - Programming languages used in the project

<br>
<div align="center">

| Name | Type | Description | Languages |
|:------:|:-----------:|:--------:|:-------:|
| [`architecture.sh`](./information/architecture.sh) | Script | Return operating system and machine name, check OS compatibility | Bash |
| [`restart_process.sh`](./execution/restart_process.sh) | Script | Run process and restart it if it exits with an error | Bash |

</div>
<br>

## Development

Below you will find a table of projects that are either under development or planned to be implemented in the future. These include scripts, improvements to existing scripts or the repository in general.

Each entry in the table contains the following information:
* **Name** - Name of the project (might be subject to change)
* **Type** - Type of the project (script, improvement, etc.)
* **Description** - Short description of the project purpose
* **Status** - Current status of the project development:
    * :large_blue_circle: - in progress
    * :white_circle: - draft & planning
    * :stop_sign: - progress halted
    * :x: - discontinued

<br>
<div align="center">

| Name | Type | Description | Status | Branch |
|:----:|:----:|:-----------:|:------:|:------:|
| `check_cpu.sh` | Script | Return current information about CPU load | :large_blue_circle: | [`scripts/check_cpu`](https://github.com/neurowelt/system-tools/tree/scripts/check_cpu) |
| `check_gpu.sh` | Script | Return current information about GPU usage | :white_circle: | - |

</div>
<br>

## Motivation

Main motivation beind this repository is to learn bash scripting and have a collection of different variety of scripts that come in handy in day to day wandering around the operating system.

Another goal is to include other programming languages and build a library of scripts that either directly interact with system processes or utilize tools gathered in this repository to achieve that interaction.

## Contributing

Contributions are always welcome! Especially if you:
* have an idea for a new project, whether it is a script or a document that provides some insight
* have a suggestion for improving existing projects
* found a bug or inconsistency in the code
* feel like the structure, naming conventions or any other organizational aspect of the repository could be improved

If anything from the above list sounds like you, feel free to open an issue or a pull request. If you are not sure where to start, check out the [Development](#development) section for ideas on what projects are currently in progress or planned for the future.

### Guidelines

When contributing to this repository, please follow these guidelines:

* For Bash scripts, this repository aims to follow [Google's bash scripting convention](https://google.github.io/styleguide/shellguide.html) as close as possible. If you find any inconsistencies, feel encouraged to open an issue.
