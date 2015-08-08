mongoose = require 'mongoose'
Schema = mongoose.Schema;

userSchema = new Schema
  mail: String
  password: String
  username: String

userSchema.statics =
  auth: (mail, password) ->
    console.log 'test:User.auth:{mail}{password}'


User = mongoose.model "User", userSchema

module.exports = User