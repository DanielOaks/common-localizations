Common Localizations
====================
This is a project to compile a whole bunch of common game translations. The translation work is not done by me – this is just a project to try and take the source spreadsheet and turn it into some output formats.

**All the translations in this repo are done by the users in the `Love Thread <https://love2d.org/forums/viewtopic.php?f=4&t=78754>`_ and on the `Google spreadsheet <http://goo.gl/fhnw1t>`_, and are under the MIT license.**


Installing dependencies
-----------------------
This is built on `Python3 <https://www.python.org/downloads/>`_, and uses the `Pip <http://pip.readthedocs.org/en/latest/installing.html>`_ extension to install dependencies. Once you have those two installed, run:

.. text::

    $ pip3 install -r requirements.txt

This will install the dependencies required to build the output files.


Updating source files
---------------------
To update the source file from Google Sheets, run:

.. text::

    $ ./commonlocal.py update

The source file is put in `source.xlsx`.


Generating new output files
---------------------------
To generate the output files, run:

.. text::

    $ ./commonlocal.py generate

The output files will be generated in `output/`.


License
-------
The code in this repo is released into the public domain.

The translations are **not done by me**. They are licensed under the MIT license as detailed in the `Google spreadsheet <http://goo.gl/fhnw1t>`_ and the `Love Thread <https://love2d.org/forums/viewtopic.php?f=4&t=78754>`_.
