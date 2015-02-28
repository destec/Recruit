bookshelf = require '../util/sqlutil'

AdmitStudent = bookshelf.Model.extend
  tableName: 'AdmitStudent'

module.exports = AdmitStudent