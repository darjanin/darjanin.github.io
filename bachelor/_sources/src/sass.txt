Sass
======

First steps to the Sass
-----------------------

History
#######

.. Source for history informations is http://sass-lang.com/about.html

Sass (Syntaticly awesome stylesheet) is meta-language created on top of CSS. It's main purpose is to provide more enhanced features to the CSS that are useful for creating manageable stylesheets. It was originally created by `Hampton Catling <http://www.hamptoncatlin.com/>`_. He and `Nathan Weizenbaum <http://nex-3.com/>`_ designed Sass through 2.0 version. Nathan is the primary designer of Sass and the main developer since its inception. In late 2008 `Chris Eppstein <http://chriseppstein.github.com/>`_ joined the Sass team . Chris and Nathan designed Sass from version 2.2. Another accomplishment of Chris is the `Compass <http://compass-style.org/>`_, the first Sass-based framework.

.. .. figure:: ../_static/images/Sass_Logo.png
..     :align: center
..     :alt: Sass Logo
..     :figclass: align-center

..     Sass logo

The official implementation is done in Ruby. And through this manual I will be using only this one. There are attempts to make Sass interpreter in Javascript so you can run it on the server with Node.js or PHP version named `PHPSass <http://www.phpsass.com/>`_. Sass is available under the `MIT License <http://sass-lang.com/docs/yardoc/file.MIT-LICENSE.html>`_.

Installation
############

After few words from history is time to move on. Before we can start with the syntax, it's necessary to install the Sass interpreter. How I said before we will be using Ruby implementation. And because we have many operating systems with different dependencies I will give you hints how to prepare your system.

**Windows**

The Windows does not come with  Ruby installed at default. The fastest way how to install it is to download `RubyInstaller <http://rubyinstaller.org/downloads/>`_. 
When it is done, go to Start Menu, Accessories and run Command Prompt. But faster would be to press `Win+R` and put in the `cmd` command and press Run. Next step is same for all platforms.

**Linux**

This category is more general, while there are many distribution with Linux kernel. But the most used systems today have roots in Debian. In this group you can add Debian, Ubuntu, Linux Mint and so on. If you are using Arch, then I don't think think you need to read how to install Ruby. 

For Debian based systems you just need to start Terminal and run in it

.. code-block:: bash

    sudo apt-get install ruby1.9.1

It will ask your password and after that it will install Ruby.

**MacOS X**

Your new Mac comes with Ruby installed. So only thing that you must do is to find your terminal. You can use Spotlight and write in it Terminal. And run it.

**Last step**

At the end to install the Sass gem just write following command into the terminal or command prompt. When the installation ends, you are done.

.. code-block:: bash

    gem install sass

Hello World example
###################

It's good idea to try if it works. Run in terminal or command prompt

.. code-block:: bash

    sass --scss

Your input would be

.. code-block:: scss

    $header-color: #fe3242;

    h1 {
        color: $header-color;
    }

And when you are done press `Ctrl+D`. You should get

.. code-block:: css

    h1 {
        color: #fe3242;
    }

As can you see, the line starting with dollar sign disappeared and the color value has changed to value defined for `$header-color`. This is simple example of using variables in Sass. When there was no problems you can move to the next chapter.

Compiling Sass
###################

In "Hello World example" the code runs in the interactive mode of the Sass, but in real life you write code into files. For that sass console application has options that helps with that. There exist GUI applications for working with Sass, but I'm a CLI guy and I think you will like it too. 

The easiest way how to convert `.sass` or `.scss` file to the `.css` version is using following command.

For files 

.. code-block:: bash

    sass --watch input.scss:output.css

For whole directories

.. code-block:: bash

    sass --watch input-dir:output-dir



Sass Syntax
--------------

After details how to setup up your working environment for Sass, it's time to move on to the syntax of this language. How I said earlier anything written in CSS is valid Sass code. It's not always true. The thing is that Sass has two possible syntaxes. The older one, called simply Sass with extension `.sass`, takes inspiration in `Haml <http://haml.info/>`_. There are no semicolons, no curly brackets and few more differences from style that will be used. The important thing in it is using indention. If you met languages like Ruby or Python, than you should be familiar with the concept. For people who have no clue what I'm talking about, is here small example.

First is the code in Sass (.sass extension)

.. code-block:: scss

    #main
        background: red;
        color: white
        a
            font:
                weight: bold
                size: 2em
                family: serif
            color: yellow
            &:hover
                color: green

And now CSS equivalent to code above.

.. code-block:: css

    #main {
        background: red;
        color: white;
    }
    #main a {
        font-weight: bold;
        font-size: 2em;
        font-family: serif;
        color: yellow;
    }
    #main a:hover {
        color: green;
    }

This approach to the syntax has some advantages and if you have some experience with languages where indention is so important than go for it. But in this materials I will be using most often the SCSS (Sassy CSS) syntax. It's more similar to CSS so there would be no problems to start using Sass, what is main purpose of this tutorial. 

Variables
#########

How often happened to you that you were writing CSS, in which you need to set up color for some element, but you don't remember the code of used color? You can still find it in document, but it could take some time. 
Or another example. You got some code at which had worked other developer and only thing that you need to do is to change colors of all links in the document. The problem is that you don't know in how many declarations is that color used in document and how we can see later, code written in Sass is often divided in many files. If the previous developer used variable to store the color value, than your work would be just to find the declaration of color for link and change it.

In this example situations variables come to be handy. It's true that they are often used as constants in Sass. There are no problems to change their values later, but it is not good practice to do so, while it can start to be mess and you can not be sure which value is used at the moment so easily. The definition of variable starts with symbol `$` following with the variable name, double-colon and the variable value. The value can be color code in any format supported in CSS, string, number or length with unit.

.. code-block:: scss

    $color-var-name: rgba(42,42,42,1);
    $length-var-name: 960px;
    $string-var-name: "|";
    $number: 0.2;

    #main {
        width: $length-var-name
    }    
    a {
        color: $color-var-name;
        opacity: $number;
    }

.. code-block:: css

    #main {
        width: 960px;
    }
    a {
        color: rgba(42,42,42,1);
        opacity: 0.2;
    }

.. note::
    
    **Naming conventions**
    They are inherited from CSS. The name for variable should be created from alphanumeric symbols and separated by hyphen. The name should say enough about the value that is saved in it. Try to avoid names like `$red-color` and than use it for all your links. Better approach is to create color scheme like `$red: #E03838;`,than create `$link-color: $red;` and use it for links. If you came to state that you need to change the color from red to green, you will just declare `$green` and set the `$link-color` to it. It's better, because if you stay with `$red-color`, than you will probably change the value stored in `$red-color` to green and it does not make sense.  

Nesting
#######

I'd like to start with simple CSS code for horizontal navigation.

.. code-block:: css

    nav { position: absolute; right: 5em; bottom: 2em; }
    nav ul { list-style: none; }
    nav ul li { display: inline; }
    nav ul li a { color: #4590DE; text-decoration: none; }
    nav ul li a:hover { text-decoration: underline; }

You probably met similar code already. If you look at it you can see that I repeated some selectors. They are important for the final style, but when you are writing code, you don't want to repeat yourself. Computers are good for repetitive work so why don't use them for this too? Sass has solution for this. It's called nesting. It's main idea is that child elements are written inside of the parent curly brackets. Than I can rewrite the CSS code into.

.. code-block:: scss

    nav {
        position: absolute;
        right: 5em;
        bottom: 2em;
        ul {
            list-style: none;
            li {
                display: inline;
                a {
                    color: #4590DE;
                    text-decoration: none;
                    &:hover {
                        text-decoration: underline;
                    }
                }
            }
        }
    }

The indention in code is not important, but it's recommended, for easier reading of the code. How you can see I didn't repeat any selector. There is interesting syntax with the ampersand. `&:hover`. The ampersand stands for the parent selector. The reason why I didn't used it for previous declaration is that it's added there automatically. So if you write 

.. code-block:: scss

    nav {
        ul {

        }
    }

it can be rewritten using `&`-syntax to

.. code-block:: scss
    
    nav {
        & ul {

        }
    }

We need to refer on the parent selector in case that there is no need for space between selectors. For example when we use pseudo-classes or pseudo-selectors.

.. code-block:: scss
    
    table {
        &.users-mode {
        }
    } 

will be translated to 

.. code-block:: css
    
    table { }
    table.users-mode {   }

There is one more way where to use nesting: CSS properties. Some of them are created with some prefix like font-, text-, border-,etc. and if you are going to set more of them you can use the short version, but sometimes you need to specify it more explicit. Then nesting comes handy. The example would be best for it.

.. code-block:: scss

    .block {
        border: {
            width: thin thin 0 0;
            color: red blue;
            style: solid;
        }
    }

.. code-block:: css 

    .block {
        border-width: thin thin 0 0;
        border-color: red blue;
        border-style: solid; 
    }


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

**Data types**

The SassScript supports 6 data types. There is no need to declare them. It will be automatically done. They are

- numbers, e.g. 1.2, 13, 10px 
- strings with and without quotes, e.g. "cube", 'triangle', line
- colors, e.g. red, #123456, rgba(234,123,0, 0.8)
- booleans, e.g. true, false
- null
- list of values separated by spaces or commas, e.g. thin solid black

You don't need thing about these types a lot. Only in cases that you store for example string into variable, but you want to use it to set a size of font. In this case it doesn't make sense.

**Functions**

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

*Generating a color palette*

..  http://www.slideshare.net/verekia/deep-dive-into-css-preprocessors <- source of code

Nice example of using the functions is generating color palette. You need only to set the base color. In case that you would change it for any reason, other colors will change depending on it. Experimenting with the color palette is then rather simple.

.. code-block:: scss

    $base: #633;
    $complement1: adjust-hue($base, 180);
    $complement2: darken(adjust-hue($base, 180), 5%);
    $lighten1: lighten($base, 15%);
    $lighten2: lighten($base, 30%);

@-rules and directives
###########################

Sass supports all CSS @-rules like `@import`, `@media` or `@font-face`, but some of them extend and gives them more power.

**@import**

Once using Sass, you'll probably meet this rule quite often. It extends CSS import rule, so you can import `.scss` and `.sass` files. The output will be merged into one single CSS file and all variables and mixins defined in the imported files will be available in the main file. With this behavior you can split your styles into smaller files defining specific elements. It makes easy to append or edit the code.

There are some special circumstances at which will the @import rule works like the CSS. 

- The file's extension is `.css`.
- The filename begins with `http://`.
- If the filename is `url()`.
- If the `@import` has any media queries.

.. code-block:: scss
    
    @import "cube.css";
    @import "cube" screen;
    @import "http://cube.edu/style";
    @import url(cube);

.. code-block:: css

    @import "cube.css";
    @import "cube" screen;
    @import "http://cube.edu/style";
    @import url(cube);

If we want to import the file `cube.scss` we can write

.. code-block:: scss

    @import "cube.scss";

or just simply

.. code-block:: scss

    @import "cube";

If you want to import more files, it's possible to write

.. code-block:: scss
    
    @import "first", "second";

If you name the `.scss` file with underscore before filename `_cube.scss`, then its code will be added to the main `.css` file, but it will not be compiled to CSS. In `@import` you don't need to write the underscore, but it's important that in the same folder can not be  more files with the same name. (If in folder is `cube.scss`, than you can not use `_cube.scss`). This type of naming of files is called partials.

One of earlier mentioned features of Sass is nesting and it's possible to use it with `@import`.  Most of time you will use the `@import` at the top of the document. But there can come situation when it would be handy to include whole another file into some class. At that case you can call `@import` under class. 

This is demonstrated in the example that follows. The `box.scss` and `screen.scss` contain following code

.. code-block:: scss

    // Content of the box.scss
    .box {
        color: red;
        .button {
            background: #444;
        }
    }

    // Content of the screen.scss
    .screen {
        @import 'box.scss';
    }

The compiled version is

.. code-block:: css

    .screen .box {
        color: red;
    }
    .screen .box .button {
        background: #444;
    }

There are few exceptions. There exists directives that can be only at the base level of the document. So if you are calling `@import` into selector than the imported file can not contain `@mixin` and `@charset`. It's not possible to @import in mixins and control directives.

**@media**

`@media` directive can be used as defined in the plain CSS, but it has one extra capability - it can be nested in CSS rule.  If it appears nested, than it bubble to the base level, containing all selectors in which it's included. This approach helps to make your code readable if you are using the @media.

.. code-block:: scss

    .sidebar {
        width: 300px;
        @media screen and (orientation: landscape) {
            width: 500px;
        }
    }

.. code-block:: css

    .sidebar {
        width: 300px;
    }

    @media screen and (orientation: landscape) {
        .sidebar {
            width: 500px;
        }
    }

This way you don't break the flow of your selectors that are nested into each and again you don't need to repeat to writing the selector that you want to specify with @media. You can complain that you often write the value for the `@media`, but we have variables. This is nice place where you can use it.

.. code-block:: scss 

    $landscape: 'screen and (orientation: landscape)';

    .sidebar {
        width: 300px;
        @media #{landscape} {
            width: 500px;
        }
    }

    .content {
        width: 400px;
        @media #{landscape} {
            width: 600px;
        }
    }

.. code-block:: css

    @media screen and (orientation: landscape) {
        .sidebar {
            width: 500px;
        }
        .content {
            width: 600px;
        }
    }

    .sidebar {
        width: 300px;
    }
    .content {
        width: 400px;
    }

You can define  more @media properties for specific devices at the start and if you need to change some properties you don't need to look through documents where you write device-specific rules and no selectors were written twice.

**@extend**

There are often cases when you need to use the all rules from one selector and add only some new. Most used way how to do that is using some general class and than more specific class that sets the different properties. Than the HTML will be following

.. code-block:: html

    <div class="error error-login">
        Sorry, bad login or password. Try it again.
    </div>

The css to the code will be

.. code-block:: css

    .error {
        border: thin solid #FF5151;
        background-color: #F9E9E9;
    }

    .error-login {
        border-width: thick;
    }

This approach is functional and it's often used, but you must not forgot the error class. The `@extend` directive helps to avoid the some problems that are possible using this way. Than in the HTML will be written

.. code-block:: html
    
    <div class="error-login">
        Sorry, bad login or password. Try it again.
    </div>

.. code-block:: scss

    .error {
        border: thin solid #FF5151;
        background-color: #F9E9E9;
    }
    .error-login {
        @extend .error;
        border-width: thick;
    }

.. code-block:: css

    .error, .error-login {
        border: thin solid #FF5151;
        background-color: #F9E9E9;
    }
    .error-login {
        border-width: thick;
    }

`@extend` works by inserting extending selector anywhere the extended selector appears. For better illustration I add an example.

.. code-block:: scss

    .error {
        border: thin solid red;
        padding: .5em;
        color: red;
    }
    .error.icon {
        background: url('images/error.png');
    }
    .error-login {
        @expand .error;
        font-weight: bold;
    }

.. code-block:: css

    .error, .error-login {
        border: thin solid red;
        padding: .5em;
        color: red;
    }

    .error.icon, .error-login.icon {
        background: url('images/error.png');
    }

    .error-login {
        font-weight: bold;
    }

If you are familiar with Object Oriented languages such Java or C++ you sure know the meaning of abstract class or function. There are not allowed instances from abstract classes, so they must be inherited by another class. In Sass exists similar way how to define the selector. It's called "placeholder selectors". They are defined in Sass version of code, but they are not compiled to the CSS. Only if they are extended by another selector. It helps to avoid names collisions and the in the output CSS they show up only if they are needed. They are most of time used if you are creating framework. The syntax difference from the selectors for classes and ids only in first characters. You don't use the `.` or `#`, but `%`. So "placeholder selector" for the error could be `%error`. Everything else works like it is normal selector.

The main difference between using extend and mixins for the output CSS. Say that we want to create four buttons and only the color of the background would be changed. If you use mixins for that the output would have the same code for every button generated, and only the color codes would be different. On other hand, if you extend generic "placeholder selector"  for buttons and set for each one only different color, than the generated CSS will have shorter code. In situation when you want to load your site as fast as possible is this approach good idea. But always this things depends on the situation.

If you want to use `@extend` inside of the media block, there is some restrictions. You can extend only selectors that are inside of the media block.

Mixins
#######

Some of many advantages of Sass is keeping your code readable and don't repeating yourself. For the purpose of DRY (don’t repeat yourself) mixins exist and like many things in Sass come from “Ruby universe”, mixins exists there too. The way how mixins work is to include their code at the place where they were called. 


**Defining a Mixin with `@mixin`**

Mixins are defined with the directive `@mixin` following with the name of mixin and optionally the arguments. After that is there a block containing content of mixin closed into curly brackets.

.. code-block:: scss

    @mixin button {
        border: thin solid #40AECA;
        background: #85C7D8;
        border-radius: 5px;
        color: white;
        &:hover {
            background: #7EB7C6;
        }
    }

If you try to compile this with sass, than the output will be empty. The reason is that you don't use the mixin. And the second thing what you can see at definition of mixin is `&:hover`. We met with it in nesting, but there we knew who was parent. Here will be the parent selector defined at the moment of calling the mixin.

For inserting the content of the mixin use `@include` directive. 

.. code-block:: scss
    
    .button {
        @include button;
        height: 30px;
    }

.. code-block:: css

    .button {
        border: thin solid #40AECA;
        background: #85C7D8;
        border-radius: 5px;
        color: white;
        height: 30px;
    }
    .button:hover {
            background: #7EB7C6;
        }

But this is not all what comes with mixins. I give you example when you need to have same styled buttons, but with different background colors. You can define the new color after `@include button`, but there comes some repeating work. You must always define the new behavior for the hover state too. All because of using different color. How can we improve it? We can use the arguments that would be passed to the mixin. The best way how to explain it would be with example.

Say that you want to create three different color buttons. One would be normal with light gray background and would be for classic actions. Next on would be the error button that has red background and finally information button with blue background. And we want to define one mixin and then change just colors when we include it.

.. code-block:: scss
    
    @mixin button($color) {
        border: thin solid $color - #222222;
        background: $color;
        border-radius: 5px;
        color: white;
        padding: 5px;
        &:hover {
            background: $color - #161616;
        }
    }

    .button { 
        @include button(#B1B1B1);
    }

    .error-button {
        @include button(#FB4242);
    }

    .info-button {
        @include button(#549EE5);
    }

.. code-block:: css
    
    .button {
      border: thin solid #8f8f8f;
      background: #b1b1b1;
      border-radius: 5px;
      color: white; 
      padding: 5px; }
      .button:hover {
        background: #9b9b9b; }

    .error-button {
      border: thin solid #d92020;
      background: #fb4242;
      border-radius: 5px;
      color: white;
      padding: 5px; }
      .error-button:hover {
        background: #e52c2c; }

    .info-button {
      border: thin solid #327cc3;
      background: #549ee5;
      border-radius: 5px;
      color: white;
      padding: 5px; }
      .info-button:hover {
        background: #3e88cf; }


Knowledge of this techniques is enough for you to start using the Sass on daily basis. There exists some more advanced things that comes handy, but their main purpose is for make more flexible code that can be part of framework like Compass. If you work on large projects and you use some styling techniques often, than it could be good idea to invest some time to write them into simple framework for you and use it in your projects, but before you start writing everything on your own, it could be good idea to jump to the chapter about Compass and look if things that you need do exist in it. 

Control Directives
#############################

SassScript supports control directives for including styles only under specific condition or including same style several times with variations. Their main purpose is to use them in mixins, those that are part libraries like Compass and requires flexibility.

**@if**

`IF` is one of the basics directives for control the flow. The style would be applied only if the condition returns anything else than `false` or `null`.  In conditions are allowed logical operations `and` and `or` that require at least two conditions and the negation `not`.

.. code-block:: scss

    p {
        @if 1 + 1 == 2 { border: 1px solid; }
        @if not(5 > 3)   { border: 2px dotted; }
        @if null             { border: 4px dashed;}
    }

.. code-block:: css

    p { border: 1px solid; }

At case that you need to check if the variable content is one of many, than comes handy the `@else if`. The last must be `@else`.

.. code-block:: scss
    
    $language: ruby;
    p {
        @if $language == python {
            background: green;
        } @else if language == c# {
            background: blue;
        } @else if language == ruby {
            background: red;
        } @else {
            background: yellow;
        }
    }

.. code-block:: css
    
    p { background: red; }

**@for**

In case that you need to repeat some action with different value in the output, you can use `@for` loop. It sets the value in variable from starting point to end. There are two forms of for-loop in Sass. First is `@for $var from <start> through <end>` and the second is `@for $var from <start> to <end>`. The variable `$var` is normal variable that can be named arbitrarily. It's common to name it `$i`. The `<start>` and `<end>` can be any expressions that return integer. The difference between these two forms is in the `trough` and `to`. If you use `through` the `<end>` value will be used at the end. If you use `to` the loop stops at the `<end>-1` value.

.. code-block:: scss
    
    @for $i from 1 to 4 {
        .item-#{$i} { width:  2em * $i; }
    }

.. code-block:: css

    .item-1 { width: 2em; }
    .item-2 { width: 4em; }
    .item-3 { width: 6em; }

**@each**

The for-loop is good if you are working with numbers. But if you want to work with list of words, than using the `@each` is better decision.  The syntax for each is simple. `@each $var in <list>`. The variable `$var` is working the same way how in the for-loop. So in every step the `$var` value is equal to one of the items in the list. 

.. code-block:: scss

    @each shape in circle, triangle, square {
        .#{shape}-icon {
            background-image: url('/images/#{shape}.png');
        }
    }

.. code-block:: css

    .circle-icon { background-image: url("/images/circle.png"); }
    .triangle-icon { background-image: url("/images/triangle.png"); }
    .square-icon { background-image: url("/images/square.png"); }

**@while**

If the step one that is in the for-loop is not good for you, than you must use the while. It will run until the condition is true. The syntax is as showed here:

.. code-block:: scss

    @while condition {
        // code
    }

And example

.. code-block:: scss

    $i: 6;
    @while $i > 0 {
        .box-#{$i} {
            width: 2em * $i;
            $i: $i - 2;
        }
    }

.. code-block:: css

    .box-6 { width: 12em; }
    .box-4 { width: 8em; }
    .box-2 { width: 4em; }