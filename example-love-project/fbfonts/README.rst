FallbackFonts
=============
This library aims to make it super simple to define and use fallback fonts when printing and drawing text. It only works on an **single-line basis** right now, which means no having two languages in a single string or it'll skip both of those language-specific fonts and go to your fallback!

*FbFonts* aims to mostly replicate the standard Love library in terms of functions, to make it simple to swap in and just find-replace standard library functions with our replacements. In the future, it may be easier to hook into the standard library functions instead.


FbFonts.setNewFonts(filenames, size)
------------------------------------
This sets the list of fonts that *FbFonts* uses to print text. When we print a line, FbFonts will cycle through the given fonts and see if one can print that line, selecting the appropriate font.

Say that you have a font that supports Japanese, one that supports English, and another that supports German, and you wish to be able to print strings from all three of these languages.

You would do something like this::

    size = 30
    FbFonts.setNewFonts({'japanese.ttf', 'english.ttf', 'german.ttf'}, size)

When you use ``FbFonts.print`` or ``FbFonts.printf``, if you use a line with Japanese characters it will select the Japanese font, if you use one with German characters it will select the German font, and if you use English characters, the English font will be selected.

If the string you're printing is not completely supported by any of the current fonts, it will be printed with the first font in your list. We recommend including something like `Unifont <http://unifoundry.com/unifont.html>`_ as the last font in your list, as a fallback in case nothing else can do.


FbFonts.print(text, x, y, r, sx, sy, ox, oy, kx, ky)
----------------------------------------------------
Used in exactly the same way that ``love.graphics.print`` is used, just selects the right font beforehand!


FbFonts.printf(text, x, y, limit, align, r, sx, sy, ox, oy, kx, ky)
-------------------------------------------------------------------
Used in exactly the same way that ``love.graphics.printf`` is used, just selects the right font beforehand!


License
-------
The code in this repo is written by Daniel Oaks and is released into the public domain.
