Invader
=======

A work in progress random SpaceInvader generator inspired by my original, open-source-code-as-art hero, Jared Tarbell.

Demo: http://olizilla.github.com/invader/

Uses:

- Coffee Script to codify the things
- LESS to style the things
- Grunt to tidy and translate the things to JS & CSS
- [GRUNTEND](https://github.com/alanshaw/gruntend) as a handy foundation and leg up


Getting Started
---------------

Install [Node.js](http://nodejs.org/)

Install grunt:

	npm install -g grunt

Install plugins:

	cd /path/to/gruntend
	npm install

Build the site:

	grunt

The built site can be found at dist/

Grunt can watch the project and compile LESS and coffeescript when you make changes to the files. Grunt is setup to _not_ minify files when watching them to aid debugging whilst in development.

	grunt watch

Project build settings are configured in the usual `grunt.js` file.
