# Generate shell module script for sh_util

**gen_sh_mod** is shell tool for generating shell module.

Developed in **[bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))** code: **100%**.

[![gen_sh_mod shell checker](https://github.com/vroncevic/gen_sh_mod/workflows/gen_sh_mod%20shell%20checker/badge.svg)](https://github.com/vroncevic/gen_sh_mod/actions?query=workflow%3A%22gen_sh_mod+shell+checker%22)

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

Navigate to release **[page](https://github.com/vroncevic/gen_sh_mod/releases)** download and extract release archive.

To install modules type the following:

```
tar xvzf gen_sh_mod-x.y.z.tar.gz
cd gen_sh_mod-x.y.z
cp -R ~/sh_tool/bin/   /root/scripts/gen_sh_mod/ver.1.0/
cp -R ~/sh_tool/conf/  /root/scripts/gen_sh_mod/ver.1.0/
cp -R ~/sh_tool/log/   /root/scripts/gen_sh_mod/ver.1.0/
```

![alt tag](https://raw.githubusercontent.com/vroncevic/gen_sh_mod/dev/docs/setup_tree.png)

Or You can use docker to create image/container.

[![gen_sh_mod docker checker](https://github.com/vroncevic/gen_sh_mod/workflows/gen_sh_mod%20docker%20checker/badge.svg)](https://github.com/vroncevic/gen_sh_mod/actions?query=workflow%3A%22gen_sh_mod+docker+checker%22)

### Usage

```
# Create symlink for shell tool
ln -s /root/scripts/gen_sh_mod/ver.1.0/bin/gen_sh_mod.sh /root/bin/gen_sh_mod

# Setting PATH
export PATH=${PATH}:/root/bin/

# Generating shell module
gen_sh_mod change_user_permissions
```

### Dependencies

**gen_sh_mod** requires next modules and libraries:
* sh_util [https://github.com/vroncevic/sh_util](https://github.com/vroncevic/sh_util)

### Shell tool structure

**gen_sh_mod** is based on MOP.

Code structure:
```
.
├── bin/
│   └── gen_sh_mod.sh
├── conf/
│   ├── gen_sh_mod.cfg
│   ├── gen_sh_mod_util.cfg
│   └── template/
│       └── module.template
└── log/
    └── gen_sh_mod.log
```

### Docs

[![Documentation Status](https://readthedocs.org/projects/gen_sh_mod/badge/?version=latest)](https://gen_sh_mod.readthedocs.io/projects/gen_sh_mod/en/latest/?badge=latest)

More documentation and info at:
* [https://gen_sh_mod.readthedocs.io/en/latest/](https://gen_sh_mod.readthedocs.io/en/latest/)
* [https://www.gnu.org/software/bash/manual/](https://www.gnu.org/software/bash/manual/)

### Copyright and licence

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright (C) 2016 by [vroncevic.github.io/gen_sh_mod](https://vroncevic.github.io/gen_sh_mod)

**gen_sh_mod** is free software; you can redistribute it and/or modify
it under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

