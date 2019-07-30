Compass
================================

At this point you should know enough about Sass and what is possible to do in it. There are many ways how to use it. You can use the approach of writing everything for yourself and only if you need it. There are probably some of you who always work this way. But many developers want to save time to start next project. They often take some framework, that has the common things written and they just write the new parts specific for their project. The community about Sass is not different. There is not just one framework that you can use, but in this tutorial I will talk about the oldest and probably the most used of them. Compass. 

If you have some time to spare and learn something more, than I recommend to go through the code of the Compass, that you can find in it's public repository on the GitHub: `github.com/chriseppstein/compass <https://github.com/chriseppstein/compass>`_. There are more than just Sass code, while Compass has own tools to create projects. Important for you is to target the framework and then compass folder, where you can find only styles written in Sassy CSS (.scss).

Installation
############

Installation of this framework is simple. Important is to have installed Sass. If you for some reason don't, than go to the chapter about Sass, where is written the guide for installation. Put following command into console:

.. code-block:: bash
	
	gem install compass

There is possibility that on the UNIX/Linux systems will you need to add `sudo` before the command, while it will want to write into protected folders own data. It will download and set up path to compass files and prepare it to using for you.