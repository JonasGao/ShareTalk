mongoose = require 'mongoose'
Schema = mongoose.Schema;

userSchema = new Schema
  mail: String
  password: String
  username: String

userSchema.statics =
  findByMail: (mail, callback) ->
    console.log 'test:User.auth:{mail}{password}'
    callback false

User = mongoose.model "User", userSchema

module.exports = User