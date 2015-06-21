@-rules and directives
###########################

Sass supports all CSS @-rules like `@import`, `@media` or `@font-face`, but some of them extend and gives them more power.

@import
************

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

@media
************

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

@extend
************

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