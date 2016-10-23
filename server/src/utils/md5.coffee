crypto = require 'crypto'

exports.toMd5 = (text) ->
  md5 = crypto.createHash 'md5'
  md5.update(text, 'utf-8').digest('hex')