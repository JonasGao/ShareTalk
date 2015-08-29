gulp = require 'gulp'
coffee = require 'gulp-coffee'
watch = require 'gulp-watch'
gutil = require 'gulp-util'
ngAnnotate = require 'gulp-ng-annotate'

gulp.task 'coffee-server', () ->
  files = 'src/server/**/*.coffee'
  gulp.src files, { base: './src/' }
  .pipe watch(files)
  .pipe coffee({bare: true}).on('error', gutil.log)
  .pipe gulp.dest('dest/')

gulp.task 'coffee-client', () ->
  files = [
    'src/client/main.coffee'
    'src/client/app/**/*.coffee'
  ]
  gulp.src files, { base: './src/' }
  .pipe watch(files)
  .pipe coffee({bare: true}).on('error', gutil.log)
  .pipe ngAnnotate()
  .pipe gulp.dest('dest/')

gulp.task 'default', ['coffee-client', 'coffee-server']
