gulp = require 'gulp'
coffee = require 'gulp-coffee'
watch = require 'gulp-watch'
gutil = require 'gulp-util'
ngAnnotate = require 'gulp-ng-annotate'

base = 'src/'
dest = 'dest/'

gulp.task 'coffee-server', () ->
  files = 'src/server/**/*.coffee'
  gulp.src files, { base: base }
  .pipe watch(files, { base: base })
  .pipe coffee({bare: true}).on('error', gutil.log)
  .pipe gulp.dest(dest)

gulp.task 'coffee-client', () ->
  files = [
    'src/client/main.coffee'
    'src/client/app/**/*.coffee'
  ]
  gulp.src files, { base: base }
  .pipe watch(files, { base: base } )
  .pipe coffee({bare: true}).on('error', gutil.log)
  .pipe ngAnnotate()
  .pipe gulp.dest(dest)

gulp.task 'copy', () ->
  files = [
    'src/server/bin/*'
    'src/server/views/**'
    'src/client/dep/**'
    'src/client/app/views/**/*.html'
  ]
  gulp.src files, { base: base }
  .pipe gulp.dest(dest)

gulp.task 'default', ['copy', 'coffee-client', 'coffee-server']
