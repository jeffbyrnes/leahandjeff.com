module.exports = (grunt) ->
  "use strict"

  # Load all grunt tasks
  require("jit-grunt") grunt

  # Project configuration
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    # Constants
    version: "<%= pkg.version %>"
    name: "<%= pkg.name %>"
    publicDir: "public"
    sourceStyleDir: "scss"
    releaseStyleDir: "<%= publicDir %>/css"

    # Delete generated files
    clean: ["<%= releaseStyleDir %>"]

    # Lint Coffee using CoffeeLint
    coffeelint:
      options:
        "max_line_length":
          "level": "ignore"
      gruntfile: ["Gruntfile.coffee"]

    # Compile Sass into CSS
    compass:
      options:
        importPath: [
          "bower_components",
          "bower_components/foundation/scss",
          "bower_components/font-awesome/scss",
          "<%= sourceStyleDir %>"
        ]

      prod:
        options:
          environment: "production"
          outputStyle: "compressed"
          noLineComments: true

      dev:
        options:
          environment: "development"
          outputStyle: "expanded"
          debugInfo: true
          sourcemap: true

    uncss:
      release:
        src: [
          'public/_header.php'
          'public/index.php'
          'public/_footer.php'
          'public/about.php'
        ]

        dest: 'public/css/willamette.css'

        options:
          report: 'min'

    cssmin:
      release:
        src: "<%= uncss.release.dest %>"
        dest: "public/css/willamette.min.css"

    # Watch files for changes
    watch:
      gruntfile:
        files: "<%= coffeelint.gruntfile %>"
        tasks: ["coffeelint"]

      compass:
        files: ["<%= sourceStyleDir %>/**/*.scss"]
        tasks: ["compass:dev"]

      livereload:
        options:
          livereload: true

        files: ["<%= releaseStyleDir %>/*.css", "<%= publicDir %>/**/*.php"]


  # Default task.
  grunt.registerTask "default", ["compass:dev"]
  grunt.registerTask "release", ["clean", "compass:prod", "uncss", "cssmin"]
  grunt.util.linefeed = "\n"
