SassScript
##########

Extra features that you don't find in CSS brings the SassScript. It allows to use arithmetic operations, interpolation and functions. If you want to just try some of it without writing files, than for you is there Interactive Shell.

.. code-block:: scss

    sass -i
    >> 1px + 1px + 1px
    3px
    >> #123 - #010101
    #122334
    >> #777 + #888
    white

Data types
************

The SassScript supports 6 data types. There is no need to declare them. It will be automatically done. They are

- numbers, e.g. 1.2, 13, 10px 
- strings with and without quotes, e.g. "cube", 'triangle', line
- colors, e.g. red, #123456, rgba(234,123,0, 0.8)
- booleans, e.g. true, false
- null
- list of values separated by spaces or commas, e.g. thin solid black

You don't need thing about these types a lot. Only in cases that you store for example string into variable, but you want to use it to set a size of font. In this case it doesn't make sense.

Functions
************************

The classic CSS does not have many functions. One example could be the `calc()` function for the arithmetic operations, but it's not supported in all browsers.

SassScripts brings more handy functions. For the full reference and examples to them I recommend the official documentation `SassScript Functions Reference <http://sass-lang.com/docs/yardoc/Sass/Script/Functions.html>`_. You can find there all functions with short example. For that reason I'm not going to copy it. I give you in moment one example where can be functions useful.

You can sort them base on the target area of use.

- Color functions
    - RGB
    - HSL
    - Opacity
    - Other
- String functions
- Number functions
- List functions
- Introspection functions

**Generating a color palette**

..  http://www.slideshare.net/verekia/deep-dive-into-css-preprocessors <- source of code

Nice example of using the functions is generating color palette. You need only to set the base color. In case that you would change it for any reason, other colors will change depending on it. Experimenting with the color palette is then rather simple.

.. code-block:: scss

    $base: #633;
    $complement1: adjust-hue($base, 180);
    $complement2: darken(adjust-hue($base, 180), 5%);
    $lighten1: lighten($base, 15%);
    $lighten2: lighten($base, 30%);