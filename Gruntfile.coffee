module.exports = (grunt) ->
  grunt.initConfig
    ngAnnotate:
      options:
        singleQuotes: true
      client:
        files: [
          expand: true
          src: ['public/app/*.js']
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
      client:
        files: [
          expand: true
          cwd: 'src/'
          src: ['client/**/*.html', 'client/dep/**/*.*']
          dest: 'dest'
        ]
      server:
        files: [
          expand: true
          cwd: 'src/'
          src: ['server/**/*.jade', 'server/bin/www']
          dest: 'dest'
        ]
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-ng-annotate'
  grunt.registerTask 'default', ['coffee:server', 'copy:server', 'coffee:client', 'copy:client']