# config = require('../config')
# Sequelize = require('sequelize')
# sequelize = require('../util/sqlutil')

# School = sequelize.define('School', {
#   name: Sequelize.STRING(50),
#   person: Sequelize.STRING(50)
# }, {
#   tableName: 'School'
# })

bookshelf = require '../util/sqlutil'

School = bookshelf.Model.extend
  tableName: 'School',
  defaults:
    person: "admin"

module.exports = School