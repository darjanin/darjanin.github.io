Mixins
#######

Some of many advantages of Sass is keeping your code readable and don't repeating yourself. For the purpose of DRY (don’t repeat yourself) mixins exist and like many things in Sass come from “Ruby universe”, mixins exists there too. The way how mixins work is to include their code at the place where they were called. 

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