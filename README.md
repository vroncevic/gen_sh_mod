# Generate shell module script for sh_util

<img align="right" src="https://raw.githubusercontent.com/vroncevic/gen_sh_mod/dev/docs/gen_sh_mod_logo.png" width="25%">

**gen_sh_mod** is shell tool for generating shell module.

Developed in **[bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))** code: **100%**.

[![gen_sh_mod_shell_checker](https://github.com/vroncevic/gen_sh_mod/actions/workflows/gen_sh_mod_shell_checker.yml/badge.svg)](https://github.com/vroncevic/gen_sh_mod/actions/workflows/gen_sh_mod_shell_checker.yml)

The README is used to introduce the modules and provide instructions on
how to install the modules, any machine dependencies it may have and any
other information that should be provided before the modules are installed.

[![GitHub issues open](https://img.shields.io/github/issues/vroncevic/gen_sh_mod.svg)](https://github.com/vroncevic/gen_sh_mod/issues) [![GitHub contributors](https://img.shields.io/github/contributors/vroncevic/gen_sh_mod.svg)](https://github.com/vroncevic/gen_sh_mod/graphs/contributors)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [Shell tool structure](#shell-tool-structure)
- [Docs](#docs)
- [Copyright and licence](#copyright-and-licence)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Installation

![Debian Linux OS](https://raw.githubusercontent.com/vroncevic/gen_sh_mod/dev/docs/debtux.png)

Navigate to release **[page](https://github.com/vroncevic/gen_sh_mod/releases)** download and extract release archive.

To install **gen_sh_mod** type the following

```bash
tar xvzf gen_sh_mod-3.0.tar.gz
cd gen_sh_mod-3.0
cp -R ~/sh_tool/bin/   /root/scripts/gen_sh_mod/ver.3.0/
cp -R ~/sh_tool/conf/  /root/scripts/gen_sh_mod/ver.3.0/
cp -R ~/sh_tool/log/   /root/scripts/gen_sh_mod/ver.3.0/
```

Self generated setup script and execution

```bash
./gen_sh_mod_setup.sh 

[setup] installing App/Tool/Script gen_sh_mod
	Fri Dec 12 10:26:10 PM CET 2025
[setup] copy App/Tool/Script structure
[setup] remove github editor configuration files
[setup] set App/Tool/Script permission
[setup] create symbolic link of App/Tool/Script
[setup] done

/root/scripts/gen_sh_mod/ver.3.0/
├── bin/
│   └── gen_sh_mod.sh
├── conf/
│   ├── gen_sh_mod.cfg
│   ├── gen_sh_mod.logo
│   ├── gen_sh_mod_util.cfg
│   └── template/
│       └── module.template
└── log/
    └── gen_sh_mod.log

4 directories, 8 files
lrwxrwxrwx 1 root root 50 Dec 12 10:26 /root/bin/gen_sh_mod -> /root/scripts/gen_sh_mod/ver.3.0/bin/gen_sh_mod.sh
```

Or You can use docker to create image/container.

### Usage

```bash
# Create symlink for shell tool
ln -s /root/scripts/gen_sh_mod/ver.3.0/bin/gen_sh_mod.sh /root/bin/gen_sh_mod

# Setting PATH
export PATH=${PATH}:/root/bin/

# Generating shell module
gen_sh_mod FileCheck

gen_sh_mod ver.3.0
Fri Dec 12 10:26:30 PM CET 2025

[check_root] Check permission for current session? [ok]
[check_root] Done

                                                                                      
                                          ██                                      ██  
                                         ░██                                     ░██  
    █████   █████  ███████         ██████░██            ██████████   ██████      ░██  
   ██░░░██ ██░░░██░░██░░░██       ██░░░░ ░██████       ░░██░░██░░██ ██░░░░██  ██████  
  ░██  ░██░███████ ░██  ░██      ░░█████ ░██░░░██       ░██ ░██ ░██░██   ░██ ██░░░██  
  ░░██████░██░░░░  ░██  ░██       ░░░░░██░██  ░██       ░██ ░██ ░██░██   ░██░██  ░██  
   ░░░░░██░░██████ ███  ░██ █████ ██████ ░██  ░██ █████ ███ ░██ ░██░░██████ ░░██████  
    █████  ░░░░░░ ░░░   ░░ ░░░░░ ░░░░░░  ░░   ░░ ░░░░░ ░░░  ░░  ░░  ░░░░░░   ░░░░░░   
   ░░░░░                                                                               
	                                                      
		Info   github.io/gen_sh_mod ver.3.0 
		Issue  github.io/issue
		Author vroncevic.github.io

[gen_sh_mod] Loading basic and util configuration!
100% [================================================]

[load_conf] Loading App/Tool/Script configuration!
[check_cfg] Checking configuration file [/root/scripts/gen_sh_mod/ver.3.0/conf/gen_sh_mod.cfg] [ok]
[check_cfg] Done

[load_conf] Done

[load_util_conf] Load module configuration!
[check_cfg] Checking configuration file [/root/scripts/gen_sh_mod/ver.3.0/conf/gen_sh_mod_util.cfg] [ok]
[check_cfg] Done

[load_util_conf] Done

[gen_sh_mod] Generating file [FileCheck.sh]
[gen_sh_mod] Set owner!
[gen_sh_mod] Set permission!
[logging] Checking directory [/root/scripts/gen_sh_mod/ver.3.0/log/]? [ok]
[logging] Write info log!
[logging] Done

[gen_sh_mod] Done

[check_tool] Checking tool [/usr/bin/tree]? [ok]
[check_tool] Done
```

### Dependencies

**gen_sh_mod** requires next modules and libraries
* sh_util [https://github.com/vroncevic/sh_util](https://github.com/vroncevic/sh_util)

### Shell tool structure

**gen_sh_mod** is based on MOP.

Shell tool structure

```bash
sh_tool/
├── bin/
│   └── gen_sh_mod.sh
├── conf/
│   ├── gen_sh_mod.cfg
│   ├── gen_sh_mod.logo
│   ├── gen_sh_mod_util.cfg
│   └── template/
│       └── module.template
└── log/
    └── gen_sh_mod.log
```

### Docs

[![Documentation Status](https://readthedocs.org/projects/gen_sh_mod/badge/?version=latest)](https://gen-sh-mod.readthedocs.io/projects/gen_sh_mod/en/latest/?badge=latest)

More documentation and info at
* [https://gen_sh_mod.readthedocs.io/en/latest/](https://gen-sh-mod.readthedocs.io/en/latest/)
* [https://www.gnu.org/software/bash/manual/](https://www.gnu.org/software/bash/manual/)

### Copyright and licence

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright (C) 2017 - 2026 by [vroncevic.github.io/gen_sh_mod](https://vroncevic.github.io/gen_sh_mod)

**gen_sh_mod** is free software; you can redistribute it and/or modify
it under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

Lets help and support FSF.

[![Free Software Foundation](https://raw.githubusercontent.com/vroncevic/gen_sh_mod/dev/docs/fsf-logo_1.png)](https://my.fsf.org/)

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://my.fsf.org/donate/)
