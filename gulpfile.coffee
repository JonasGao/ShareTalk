gulp = require 'gulp'
coffee = require 'gulp-coffee'
coffeeLint = require 'gulp-coffeelint'
watch = require 'gulp-watch'
gUtil = require 'gulp-util'
ngAnnotate = require 'gulp-ng-annotate'

base = 'src/'
dest = 'dest/'
files =
  coffee:
    client: [
      'src/client/main.coffee'
      'src/client/app/**/*.coffee'
    ]
    server: 'src/server/**/*.coffee'

gulp.task 'validate-coffee-server', () ->
  gulp.src files.coffee.server
  .pipe coffeeLint()
  .pipe coffeeLint.reporter()

gulp.task 'validate-coffee-client', () ->
  gulp.src files.coffee.client
  .pipe coffeeLint()
  .pipe coffeeLint.reporter()

gulp.task 'coffee-server', ['validate-coffee-server'], () ->
  f = files.coffee.server
  gulp.src f, { base: base }
  .pipe watch(f, { base: base })
  .pipe coffee({bare: true}).on('error', gUtil.log)
  .pipe gulp.dest(dest)

gulp.task 'coffee-client', ['validate-coffee-client'], () ->
  f = files.coffee.client
  gulp.src f, { base: base }
  .pipe watch(f, { base: base } )
  .pipe coffee({bare: true}).on('error', gUtil.log)
  .pipe ngAnnotate()
  .pipe gulp.dest(dest)

gulp.task 'copy', () ->
  f = [
    'src/server/bin/*'
    'src/server/views/**'
    'src/client/dep/**'
    'src/client/app/views/**/*.html'
  ]
  gulp.src f, { base: base }
  .pipe gulp.dest(dest)

gulp.task 'default', ['copy', 'coffee-client', 'coffee-server']
