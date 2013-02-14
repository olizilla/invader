module.exports = function(grunt) {
	
	grunt.initConfig({
		
		// Copy files that don't need compilation to dist/
		copy: {
			dist: {
				files: {
					// Copy all (non hidden) files (not directories) from src
					'dist/': 'src/*',
					
					// Copy any JavaScript files (not CoffeeScript src)
					'dist/js/': 'src/js/**/*.js'
				}
			}
		},
		
		// Compile all CoffeScript into main.js
		coffee: {
			compile: {
				files: {
					'dist/js/main.js': 'src/js/main.coffee'
				}
			}
		},
		
		// Compile the mobile first site stylesheet (and the no @media queries version for lt-ie8)
		less: {
			compile: {
				files: {
					'dist/css/main.css': 'src/css/main.less'
				}
			}
		},
		
		// Watch CoffeeScript, LESS & HTML files for changes, copy & compile but not minify for easy debug during dev
		watch: {
			project: {
				files: ['src/js/**/*.coffee', 'src/css/**/*.less', 'src/**/*.html'],
				tasks: 'copy less coffee'
			}
		}
	});
	
	// Load the grunt-conrtib plugin so we can compile and compress CoffeeScript and LESS files
	grunt.loadNpmTasks('grunt-contrib');
	
	grunt.registerTask('default', 'copy coffee less');
};