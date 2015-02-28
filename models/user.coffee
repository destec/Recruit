# config = require('../config')
# Sequelize = require('sequelize')
# sequelize = require('../util/sqlutil')

# User = sequelize.define('User', {
#   name: Sequelize.STRING(100),
#   password: Sequelize.STRING,
#   sex: Sequelize.STRING,
#   privilege: Sequelize.INTEGER
# }, {
#   tableName: 'User'
# })

bookshelf = require '../util/sqlutil'

User = bookshelf.Model.extend
  tableName: 'User',
  defaults:
    privilege: 0

module.exports = User
