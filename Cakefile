{print} = require 'sys'
{spawn} = require 'child_process'

build = (options)->
  coffee = spawn 'coffee.cmd', options
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()

task 'watch', 'watch', ->
  build ['-w', '-c', '-b', '-o', 'dest', 'src']

task 'build', 'build', ->
  build ['-c', '-b', '-o', 'dest', 'src']
