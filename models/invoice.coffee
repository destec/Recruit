bookshelf = require '../util/sqlutil'

Invoice = bookshelf.Model.extend
  tableName: 'Invoice'

module.exports = Invoice