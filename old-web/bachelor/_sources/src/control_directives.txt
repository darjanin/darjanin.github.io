Control Directives
#############################

SassScript supports control directives for including styles only under specific condition or including same style several times with variations. Their main purpose is to use them in mixins, those that are part libraries like Compass and requires flexibility.

@if
************

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

@for
************

In case that you need to repeat some action with different value in the output, you can use `@for` loop. It sets the value in variable from starting point to end. There are two forms of for-loop in Sass. First is `@for $var from <start> through <end>` and the second is `@for $var from <start> to <end>`. The variable `$var` is normal variable that can be named arbitrarily. It's common to name it `$i`. The `<start>` and `<end>` can be any expressions that return integer. The difference between these two forms is in the `trough` and `to`. If you use `through` the `<end>` value will be used at the end. If you use `to` the loop stops at the `<end>-1` value.

.. code-block:: scss
    
    @for $i from 1 to 4 {
        .item-#{$i} { width:  2em * $i; }
    }

.. code-block:: css

    .item-1 { width: 2em; }
    .item-2 { width: 4em; }
    .item-3 { width: 6em; }

@each
************

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

@while
************

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