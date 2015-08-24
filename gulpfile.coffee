gulp = require('gulp')
coffee = require('gulp-coffee')
watch = require('gulp-watch')
gutil = require('gulp-util')

gulp.task 'coffee', () ->
  gulp.src './src/server/**/*.coffee'
    .pipe watch('./src/server/**/*.coffee')
    .pipe coffee({bare: true}).on('error', gutil.log)
    .pipe gulp.dest('./dest/server')