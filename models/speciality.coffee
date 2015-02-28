# config = require('../config')
# Sequelize = require('sequelize')
# sequelize = require('../util/sqlutil')

# Speciality = sequelize.define('Speciality', {
#   name: Sequelize.STRING(50),
#   department: Sequelize.STRING,
#   year: Sequelize.STRING,
# }, {
#   tableName: 'Speciality'
# })

bookshelf = require '../util/sqlutil'

Speciality = bookshelf.Model.extend
  tableName: 'Speciality',
  defaults:
    department: '校直属',
    year: '2.5'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
module.exports = Speciality