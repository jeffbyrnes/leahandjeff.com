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
    sourceStyleDir: "<%= publicDir %>/scss"
    releaseStyleDir: "<%= publicDir %>/css"
    releaseJSDir: "<%= publicDir %>/js"

    # Delete generated files
    clean: [
      "<%= releaseStyleDir %>"
      "<%= releaseJSDir %>"
    ]

    # Lint Coffee using CoffeeLint
    coffeelint:
      options:
        "max_line_length":
          "level": "ignore"
      gruntfile: ["Gruntfile.coffee"]

    # Concatenate JS files
    concat:
      options:
        stripBanners: true

      dist:
        src: [
          "lib/js/modernizr.custom.js"
          "bower_components/jquery/dist/jquery.js",
          "bower_components/fastclick/lib/fastclick.js"
          "bower_components/foundation/js/foundation/foundation.js"
          "bower_components/foundation/js/foundation/foundation.abide.js"
          "lib/js/willamette.js"
        ]
        dest: "<%= releaseJSDir %>/<%= pkg.name %>.js"

    # Minify JS w/ Uglify.js
    uglify:
      options:
        banner: "<%= banner %>"
        sourceMap: true

      dist:
        src: "<%= concat.dist.dest %>"
        dest: "<%= releaseJSDir %>/<%= pkg.name %>.min.js"

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
        options:
          report: "min"
          ignore: [
            /meta\..+/
            /hover/
            /active/
            /focus/
            /data-abide/
            /error/
          ]
          stylesheets: ["css/willamette.css"]
          urls: [
            "http://local.leahandjeff.com/"
            "http://local.leahandjeff.com/about/"
          ]
        files:
          "<%= releaseStyleDir %>/willamette.css": ["**/*.php"]

    cssmin:
      release:
        src: "<%= releaseStyleDir %>/willamette.css"
        dest: "<%= releaseStyleDir %>/willamette.min.css"

    # Watch files for changes
    watch:
      gruntfile:
        files: "<%= coffeelint.gruntfile %>"
        tasks: ["coffeelint"]

      compass:
        files: ["<%= sourceStyleDir %>/**/*.scss"]
        tasks: ["compass:dev"]

      concat:
        files: ["lib/js/willamette.js"]
        tasks: ["concat"]

      livereload:
        options:
          livereload: true

        files: [
          "<%= releaseStyleDir %>/*.css"
          "<%= releaseJSDir %>/*.js"
          "<%= publicDir %>/**/*.php"
        ]


  # Default task.
  grunt.registerTask "default", ["compass:dev", "concat"]
  grunt.registerTask "release", ["clean", "compass:prod", "uncss", "cssmin", "concat", "uglify"]
  grunt.util.linefeed = "\n"
