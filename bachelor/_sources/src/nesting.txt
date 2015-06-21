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