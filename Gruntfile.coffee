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
    sourceStyleDir: "<%= publicDir %>/_scss"
    releaseStyleDir: "<%= publicDir %>/css"

    # Lint Coffee using CoffeeLint
    coffeelint:
      options:
        "max_line_length":
          "level": "ignore"
      gruntfile: ["Gruntfile.coffee"]

    # Watch files for changes
    watch:
      gruntfile:
        files: "<%= coffeelint.gruntfile %>"
        tasks: ["coffeelint"]

      livereload:
        options:
          livereload: true

        files: [
          "<%= releaseStyleDir %>/*.css"
          "<%= publicDir %>/**/*.php"
        ]

  # Default task.
  grunt.registerTask "default", ["coffeelint"]
  grunt.util.linefeed = "\n"
