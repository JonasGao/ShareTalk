module.exports = (grunt) ->
  grunt.initConfig
    ngAnnotate:
      options:
        singleQuotes: true
      client:
        files: [
          expand: true
          src: ['dest/client/app/*.js', 'dest/client/app/**/*.js']
        ]
    coffee:
      client:
        files: [
          expand: true
          cwd: 'src/'
          src: ['client/*.coffee', 'client/**/*.coffee']
          dest: 'dest'
          ext: '.js'
        ]
      server:
        files: [
          expand: true
          cwd: 'src/'
          src: ['server/*.coffee', 'server/**/*.coffee']
          dest: 'dest'
          ext: '.js'
        ]
    copy:
      'client-html':
        files: [
          expand: true
          cwd: 'src/'
          src: ['client/**/*.html']
          dest: 'dest'
        ]
      'client-dep':
        files: [
          expand: true
          cwd: 'src/'
          src: ['client/dep/**/*.*']
          dest: 'dest'
        ]
      server:
        files: [
          expand: true
          cwd: 'src/'
          src: ['server/**/*.jade', 'server/bin/www']
          dest: 'dest'
        ]
    watch:
      'coffee-client':
        files: ['src/client/*.coffee', 'src/client/**/*.coffee']
        tasks: ['coffee:client', 'ngAnnotate']
      'coffee-server':
        files: ['src/server/*.coffee', 'src/server/**/*.coffee']
        tasks: ['coffee:server']
      'client-html':
        files: ['src/client/**/*.html'],
        tasks: ['copy:client-html']
      options:
        debounceDelay: 250
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-ng-annotate'
  grunt.registerTask 'default', [
    'coffee'
    'ngAnnotate'
    'copy'
  ]