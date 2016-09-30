mongoose = require 'mongoose'

Schema = mongoose.Schema

userSchema = new Schema
  mail: String
  password: String
  username: String

userSchema.statics =
  findByMail: (mail, callback) -> this.find mail: mail, callback

User = mongoose.model "User", userSchema

module.exports = User