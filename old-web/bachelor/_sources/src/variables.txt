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