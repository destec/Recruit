bookshelf = require '../util/sqlutil'

DropStudent = bookshelf.Model.extend
  tableName: 'DropStudent'

module.exports = DropStudent