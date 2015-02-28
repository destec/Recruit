config = require('../config')
# Sequelize = require('sequelize')
# sequelize = new Sequelize(config.database, config.username, config.password, {
#   dialect: "mysql",
#   port: 3306
#})


knex = require('knex')
  client: 'mysql',
  connection: 
    host: config.host,
    user: config.username,
    password: config.password,
    database: config.database,
    charset: config.charset

bookshelf = require('bookshelf')(knex)

module.exports = bookshelf