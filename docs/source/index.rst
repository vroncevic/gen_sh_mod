gen_sh_mod
-----------

**gen_sh_mod** is shell tool for generating shell module.

Developed in `bash <https://en.wikipedia.org/wiki/Bash_(Unix_shell)>`_ code: **100%**.

|GitHub shell checker|

.. |GitHub shell checker| image:: https://github.com/vroncevic/gen_sh_mod/actions/workflows/gen_sh_mod_shell_checker.yml/badge.svg
   :target: https://github.com/vroncevic/gen_sh_mod/actions/workflows/gen_sh_mod_shell_checker.yml

The README is used to introduce the tool and provide instructions on
how to install the tool, any machine dependencies it may have and any
other information that should be provided before the tool is installed.

|GitHub issues| |Documentation Status| |GitHub contributors|

.. |GitHub issues| image:: https://img.shields.io/github/issues/vroncevic/gen_sh_mod.svg
   :target: https://github.com/vroncevic/gen_sh_mod/issues

.. |GitHub contributors| image:: https://img.shields.io/github/contributors/vroncevic/gen_sh_mod.svg
   :target: https://github.com/vroncevic/gen_sh_mod/graphs/contributors

.. |Documentation Status| image:: https://readthedocs.org/projects/gen-sh-mod/badge/?version=latest
   :target: https://gen-sh-mod.readthedocs.io/projects/gen_sh_mod/en/latest/?badge=latest

.. toctree::
    :hidden:

    self

Installation
-------------

|Debian Linux OS|

.. |Debian Linux OS| image:: https://raw.githubusercontent.com/vroncevic/gen_sh_mod/dev/docs/debtux.png
   :target: https://www.debian.org

Navigate to release `page`_ download and extract release archive.

.. _page: https://github.com/vroncevic/gen_sh_mod/releases

To install **gen_sh_mod** type the following

.. code-block:: bash

   tar xvzf gen_sh_mod-x.y.tar.gz
   cd gen_sh_mod-x.y
   cp -R ~/sh_tool/bin/   /root/scripts/gen_sh_mod/ver.x.y/
   cp -R ~/sh_tool/conf/  /root/scripts/gen_sh_mod/ver.x.y/
   cp -R ~/sh_tool/log/   /root/scripts/gen_sh_mod/ver.x.y/

Or You can use Docker to create image/container.

Dependencies
-------------

**gen_sh_mod** requires next modules and libraries

* sh_util `https://github.com/vroncevic/sh_util <https://github.com/vroncevic/sh_util>`_

Shell tool structure
---------------------

**gen_sh_mod** is based on MOP.

Shell tool structure

.. code-block:: bash

   sh_tool/
   ├── bin/
   │   ├── center.sh
   │   ├── display_logo.sh
   │   └── gen_sh_mod.sh
   ├── conf/
   │   ├── gen_sh_mod.cfg
   │   ├── gen_sh_mod.logo
   │   ├── gen_sh_mod_util.cfg
   │   └── template/
   │       └── module.template
   └── log/
       └── gen_sh_mod.log

Copyright and licence
----------------------

|License: GPL v3| |License: Apache 2.0|

.. |License: GPL v3| image:: https://img.shields.io/badge/License-GPLv3-blue.svg
   :target: https://www.gnu.org/licenses/gpl-3.0

.. |License: Apache 2.0| image:: https://img.shields.io/badge/License-Apache%202.0-blue.svg
   :target: https://opensource.org/licenses/Apache-2.0

Copyright (C) 2017 - 2024 by `vroncevic.github.io/gen_sh_mod <https://vroncevic.github.io/gen_sh_mod>`_

**gen_sh_mod** is free software; you can redistribute it and/or modify it
under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

Lets help and support FSF.

|Free Software Foundation|

.. |Free Software Foundation| image:: https://raw.githubusercontent.com/vroncevic/gen_sh_mod/dev/docs/fsf-logo_1.png
   :target: https://my.fsf.org/

|Donate|

.. |Donate| image:: https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif
   :target: https://my.fsf.org/donate/

Indices and tables
------------------

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
