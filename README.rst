Common Localizations
====================
This is a project to compile a whole bunch of common game translations. The translation work is not done by me – this is just a project to try and take the source spreadsheet and turn it into some output formats automagically using Python.

**Note:** All the translations in this repo are done by the users in the `Love Thread <https://love2d.org/forums/viewtopic.php?f=4&t=78754>`_ and on the `Google spreadsheet <http://goo.gl/fhnw1t>`_, and are under the MIT license.


Pull Requests
-------------
If you are submitting a pull request to this repo, please DO NOT INCLUDE NEWLY-GENERATED ``canonical-output/`` FILES IN YOUR PR.

The ``canonical-output/`` files are included for convenience, and if every pull request includes newly-generated files, there will be many merge conflicts and such when we merge them back into this repo.

I will regenerate new ``canonical-output/`` files when pull requests are merged.


Installing dependencies
-----------------------
This is built on `Python3 <https://www.python.org/downloads/>`_, and uses the `Pip <http://pip.readthedocs.org/en/latest/installing.html>`_ extension to install dependencies. Once you have those two installed, run::

    $ pip3 install -r requirements.txt

This will install the dependencies required to build the output files.


Updating source files
---------------------
To update the source file from Google Sheets, run::

    $ ./commonlocal.py update

The source file is put in ``source.xlsx``


Generating new output files
---------------------------
To generate the output files, run::

    $ ./commonlocal.py generate

The output files will be generated in ``output/``


Example project
---------------
Under `example-love-project`, there is an example project to show off how this library can be used.

To use it, copy the `canonical-output/lua` folder and put it in `example-love-project`, then rename it to `commonlocal`.

Here's how you would do it via the terminal::

    $ cp -r canonical-output/lua example-love-project/commonlocal


License
-------
The code in this repo is written by Daniel Oaks and is released into the public domain.

The translations are **not done by me**. They are licensed under the MIT license as detailed in the `Google spreadsheet <http://goo.gl/fhnw1t>`_ and the `Love Thread <https://love2d.org/forums/viewtopic.php?f=4&t=78754>`_.
