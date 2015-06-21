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
