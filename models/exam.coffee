bookshelf = require '../util/sqlutil'

Exam = bookshelf.Model.extend
  tableName: 'Exam'

module.exports = Exam