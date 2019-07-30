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