express = require('express')
router = express.Router()
_ = require 'lodash'
User = require '../models/user'
School = require '../models/school'
Speciality = require '../models/speciality'
AdmitStudent = require '../models/admitstudent'
DropStudent = require '../models/dropstudent'
Exam = require '../models/exam'
Invoice = require '../models/invoice'
moment = require 'moment'

# GET home page. 
router.get '/', (req, res) ->
  res.redirect '/login'

router.get '/login', (req, res) ->
  res.render 'Login/login.ejs'

router.post '/login', (req, res) ->
  res.redirect '/index'

router.get '/index', (req, res) ->
  res.render 'index'

router.get '/exam_admit_manage', (req, res) ->
  examstudent = 
    id: 1
    code1: 123456
    name: '目前无学生'
    sex: '男'
    code2: 123456
    score: 0
  res.render 'ExamManage/exam_admit_manage', {students: examstudent}

router.get '/exam_admit_detail', (req, res) ->
  examstudent = 
    id: 1
    code1: 123456
    name: '目前无学生'
    sex: '男'
    code2: 123456
    address: null
    phone: null
    birthday: null
    nation: null
    graduateschool: null
    graduateperson: null
    score1: 0
    score2: 0
    score3: 0
    score4: 0
    score5: 0
    score6: 0
    score7: 0
    extrascore: 0
    totalscore1: 0
    totalscore2: 0
    first: null
    second: null
  res.render 'ExamManage/exam_admit_detail', {student: examstudent}

router.get '/exam_score_manage', (req, res) ->
  new Exam()
  .query (qb) ->
    qb.limit 20
  .fetchAll()
  .then (model) ->
    res.render 'ExamManage/exam_score_manage', {students: model.toJSON()}

router.get '/exam_score_add', (req, res) ->
  res.render 'ExamManage/exam_score_add'

router.get '/exam_score_addmany', (req, res) ->
  res.render 'ExamManage/exam_score_addmany'

router.get '/exam_score_modify', (req, res) ->
  new Exam {id: req.query.id}
  .fetch()
  .then (model) ->
    res.render 'ExamManage/exam_score_modify', {score: model.toJSON()}

router.get '/department_stat', (req, res) ->
  departments = [
    {id: 1, name: "人文系", count: 395},
    {id: 2, name: "信息系", count: 192},
    {id: 3, name: "外语系", count: 103},
    {id: 4, name: "机电系", count: 695},
    {id: 5, name: "经贸系", count: 362},
    {id: 6, name: "艺术系", count: 302},
    {id: 7, name: "财会系", count: 307}
  ]
  res.render 'Statistics/department_stat', {departments: departments}

router.get '/score_stat', (req, res) ->
  stat = [
    {id: 1, score: "<150", count: 80},
    {id: 2, score: ">150 <200", count: 44},
    {id: 3, score: ">200 <250", count: 90},
    {id: 4, score: ">250 <300", count: 181},
    {id: 5, score: ">300 <350", count: 237},
    {id: 6, score: ">350 <400", count: 360},
    {id: 7, score: ">400 <450", count: 371},
    {id: 8, score: ">450 <500", count: 392},
    {id: 9, score: ">500 <550", count: 421},
    {id: 10, score: ">550 <600", count: 114},
    {id: 11, score: ">600 <650", count: 10}
  ]
  res.render 'Statistics/score_stat', {stat: stat}

router.get '/accommodation_stat', (req, res) ->
  stat = [
    {id: 1, situation: "在校住宿", count: 1825},
    {id: 2, situation: "不在校住宿", count: 531}
  ]
  res.render 'Statistics/accommodation_stat', {stat: stat}

router.get '/sex_stat', (req, res) ->
  stat = [
    {id: 1, sex: "男", count: 1231},
    {id: 2, sex: "女", count: 1125}
  ]
  res.render 'Statistics/sex_stat', {stat: stat}

router.get '/invoice_manage', (req, res) ->
  new Invoice()
  .query (qb) ->
    qb.limit 20
  .fetchAll()
  .then (model) ->
    res.render 'InvoiceManage/invoice_manage', {invoices: model.toJSON()}

router.get '/invoice_add', (req, res) ->
  res.render 'InvoiceManage/invoice_add'

router.get '/invoice_modify', (req, res) ->
  new Invoice {id: req.query.uid}
  .fetch()
  .then (model) ->
    res.render 'InvoiceManage/invoice_modify', {invoice: model.toJSON()}

router.get '/school_manage', (req, res) ->
  new School()
  .query (qb) ->
    qb.limit 20
  .fetchAll()
  .then (model) ->
    res.render 'SchoolManage/school_manage', {schools: model.toJSON()}

router.get '/school_add', (req, res) ->
  res.render 'SchoolManage/school_add'

router.get '/school_modify', (req, res) ->
  new School {id: req.query.uid}
  .fetch()
  .then (model) ->
    res.render 'SchoolManage/school_modify', {school: model.toJSON()}
 
router.get '/speciality_manage', (req, res) ->
  new Speciality()
  .query (qb) ->
    qb.limit 20
  .fetchAll()
  .then (model) ->
    res.render 'SpecialityManage/speciality_manage', {specialities: model.toJSON()}

router.get '/speciality_add', (req, res) ->
  res.render 'SpecialityManage/speciality_add'

router.get '/speciality_modify', (req, res) ->
  new Speciality {id: req.query.uid}
  .fetch()
  .then (model) ->
    res.render 'SpecialityManage/speciality_modify', {speciality: model.toJSON()}

router.get '/user_manage', (req, res) ->
  new User()
  .query (qb) ->
    qb.limit 20
  .fetchAll()
  .then (model) ->
    users = _.clone model.toJSON()
    _.forEach users, (user) ->
      if user.privilege is 1 then user.privilege = "管理员"
      else if user.privilege is 2 then user.privilege = "用户"
      else user.privilege = "其他"
    res.render 'UserManage/user_manage', {users: users}

router.get '/user_add', (req, res) ->
  res.render 'UserManage/user_add'

router.get '/user_modify', (req, res) ->
  new User {id: req.query.uid}
  .fetch()
  .then (model) ->
    user = _.clone model.toJSON()
    if user.privilege is 2 then user.privilege = "typer"
    res.render 'UserManage/user_modify', {user: user}

router.get '/admit_student_manage', (req, res) ->
  new AdmitStudent()
  .query (qb) ->
    qb.limit 20
  .fetchAll()
  .then (model) ->
    res.render 'StudentManage/admit_student_manage', {students: model.toJSON()}

router.get '/admit_student_detail', (req, res) ->
  new AdmitStudent {id: req.query.uid}
  .fetch()
  .then (model) ->
    res.render 'StudentManage/admit_student_detail', {student: model.toJSON()}

router.get '/admit_student_add', (req, res) ->
  res.render 'StudentManage/admit_student_add'

router.get '/admit_student_modify', (req, res) ->
  new AdmitStudent {id: req.query.uid}
  .fetch()
  .then (model) ->
    res.render 'StudentManage/admit_student_modify', {student: model.toJSON()}

router.get '/drop_student_manage', (req, res) ->
  new DropStudent()
  .query (qb) ->
    qb.limit 20
  .fetchAll()
  .then (model) ->
    students = _.clone model.toJSON()
    _.forEach students, (student) ->
      student.dropdate = moment("2014-09-15").format('YYYY-MM-DD')
    res.render 'StudentManage/drop_student_manage', {students: students}

router.get '/drop_student_detail', (req, res) ->
  new DropStudent {id: req.query.uid}
  .fetch()
  .then (model) ->
    res.render 'StudentManage/drop_student_detail', {student: model.toJSON()}

router.get '/drop_student_add', (req, res) ->
  res.render 'StudentManage/drop_student_add'

router.get '/drop_student_modify', (req, res) ->
  new DropStudent {id: req.query.uid}
  .fetch()
  .then (model) ->
    res.render 'StudentManage/drop_student_modify', {student: model.toJSON()}

module.exports = router;
