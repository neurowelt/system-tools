# Bash

In the table below you will find short descriptions of all available bash scripts and the following information about them:
* **Runnable** - Is this script runnable, i.e. does it do anything meaningful when `bash`ed?
* **Modular** - Can this script be imported for its methods into other scripts?
* **Standalone** - Is this script runnable as a standalone process, i.e. it does not require other scripts to be used? (_see note below the table for more information on exceptions_)

<br>
<div align="center">

| Script | Description | Runnable | Modular | Standalone |
|:------:|:-----------:|:--------:|:-------:|:----------:|
| `architecture.sh` | Return operating system and machine name. | :white_check_mark: | :white_check_mark: | :white_check_mark: |

</div>
<br>

> Most of the scripts will contain a method from `architecture.sh` script called `is_compatible`. It is placed at the beginning of the script to indicate on which platform the script was confirmed to successfully run. This method does not count into the **Standalone** category criteria.

Convention followed in this repository aims to be as consistent with [Google's bash scripting convention](https://google.github.io/styleguide/shellguide.html) as possible. If you find any inconsistencies, feel encouraged to open an issue.
