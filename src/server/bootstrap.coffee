app = require './app'
socket = require './socket'
debug = require('debug')('ShareTalk:server')
http = require 'http'

normalizePort = (val) ->

  port = parseInt val, 10

  if isNaN port
    return val

  if port >= 0
    return port

  return false

port = normalizePort(process.env.PORT or '3000')

app.set 'port', port

server = http.createServer app

socket server

server.listen port

server.on 'error', (error) ->

  if error.syscall isnt 'listen'
    throw error

  bind = if typeof port is 'string' then 'Pipe ' + port else 'Port ' + port

  switch error.code

    when 'EACCES'
      console.error(bind + ' requires elevated privileges')
      process.exit(1)

    when 'EADDRINUSE'
      console.error(bind + ' is already in use')
      process.exit(1)

    else throw error;

server.on 'listening', () ->

  addr = server.address()

  bind = if typeof addr is 'string' then ('pipe ' + addr) else ('port ' + addr.port)

  debug('Listening on ' + bind)