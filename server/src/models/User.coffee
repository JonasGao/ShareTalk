mongoose = require 'mongoose'

Schema = mongoose.Schema

userSchema = new Schema
  id: Number
  mail: String
  password: String
  username: String

userSchema.statics =
  findByMail: (mail, callback) ->
    console.log "根据邮箱查找: #{mail}"
    this.find mail: mail, callback

User = mongoose.model "User", userSchema

module.exports = User