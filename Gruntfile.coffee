module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    brunch:
      serve:
        action: 'serve'
        port: 3333
      compile:
        action: 'compile'
      build:
        action: 'build'

    clean: ["tmp", 'public/javascripts/*']

    coffee:
      specs:
        expand: true
        cwd:  'spec'
        src:  '**/*.coffee'
        ext:  '.js'
        dest: 'tmp/spec'

    concurrent:
      options:
        logConcurrentOutput: true
      watch:
        tasks: ["watch:src", "watch:spec"]

    jasmine:
      src: 'public/javascripts/app.js'
      options:
        specs: 'tmp/spec/**/*.js'
        vendor: "public/javascripts/vendor.js"
        helpers: [
          'node_modules/jasmine-jquery/lib/jasmine-jquery.js'
          'vendor/helpers/jasmine-jet.js'
        ]

    watch:
      src:
        files: ['app/**/*.coffee']
        tasks: 'srcSpec'
      spec:
        files: ['spec/**/*.coffee']
        tasks: 'testSpec'

  grunt.loadNpmTasks 'grunt-brunch'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'autotest', 'concurrent:watch'
  grunt.registerTask 'build', 'brunch:build'
  grunt.registerTask 'serve', 'brunch:serve'
  grunt.registerTask 'srcSpec', ['brunch:compile', 'jasmine']
  grunt.registerTask 'testSpec', ['coffee', 'jasmine']
  grunt.registerTask 'spec', ['clean', 'brunch:compile', 'coffee', 'jasmine']

  grunt.registerTask 'default', 'spec'
