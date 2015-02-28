#coding=utf-8
import MySQLdb
from datetime import *
file = open('发票.txt')
query = []

for line in file:
  # if len(line.split(',')) != 66:
  #   pass
  # else:
  #   (_code, _name, _department, _speciality, _year, _null1, _accommodation, _sex, _birthday, _null2, _nation, _null3, _null4, _graduateschool, _graduatestage, _graduateclass, _graduateperson, _address, _phone, _phone2, _null5, _null6, _null7, _null8, _null9, _null10, _null11, _null12, _null13, _null14, _null15, _null16, _code2, _score, _null17, _null18, _null19, _null20, _null21, _null22, _null23, _null24, _null25, _null26, _null27, _null28, _null29, _null30, _null31, _typer, _null32, _null33, _null34, _null35, _null36, _null37, _null38, _null29, _null40, _null41, _null42, _null43, _null44, _null45, _null46, _null47) = line.split(',')
  #   try:
  #     code = _code.decode('gb2312').encode('utf8')
  #     name = _name.decode('gb2312').encode('utf8')
  #     department = _department.decode('gb2312').encode('utf8')
  #     speciality = _speciality.decode('gb2312').encode('utf8')
  #     year = _year.decode('gb2312').encode('utf8')
  #     accommodation = _accommodation.decode('gb2312').encode('utf8')
  #     sex = _sex.decode('gb2312').encode('utf8')
  #     birthday = _birthday.decode('gb2312').encode('utf8')
  #     nation = _nation.decode('gb2312').encode('utf8')
  #     graduateschool = _graduateschool.decode('gb2312').encode('utf8')
  #     graduateclass = _graduateclass.decode('gb2312').encode('utf8')
  #     graduateperson = _graduateperson.decode('gb2312').encode('utf8')
  #     address = _address.decode('gb2312').encode('utf8')
  #     phone = _phone.decode('gb2312').encode('utf8')
  #     score = _score.decode('gb2312').encode('utf8')
  #     typer = _typer.decode('gb2312').encode('utf8')
  #     dropdate = date.today()
  #     tup = (code, name, department, speciality, year, accommodation, sex, birthday, nation, graduateschool, graduateclass, graduateperson, address, phone, score, typer, dropdate)
  #     query.append(tup)
  #   except Exception, e:
  #     print e
  (code, name, department, speciality, sex, invoicenumber, invoicebill, invoicecode, invoicedate) = line.split(',')
  try:
    tup = (code, name.decode('gb2312').encode('utf8'), department.decode('gb2312').encode('utf8'), speciality.decode('gb2312').encode('utf8'), sex.decode('gb2312').encode('utf8'), invoicenumber.decode('gb2312').encode('utf8'), invoicebill, invoicecode.decode('gb2312').encode('utf8'), invoicedate)
  except Exception, e:
    print e
  query.append(tup)
# print query     
#   # tup = (  address.decode('gb2312').encode('utf8'), phone, score, typer.decode('gb2312').encode('utf8'))
    
#   # tup = (name.decode('gb2312').encode('utf8'), department.decode('gb2312').encode('utf8'), year.decode('gb2312').encode('utf8').strip('\r\n'))
#   # query.append(tup)

conn= MySQLdb.connect(
        host='localhost',
        port = 3306,
        user='root',
        db ='Recruit',
        )
# # # query = [('admin','admin','男','1'),('饶红亮','123456','男','1'),('唐许','123456','男','2'),('李建','123456','男','2'),('刘胡生','123456','男','2'),('沈国君','123456','男','2'),('方建华','123456','男','1'),('杨书伦','123456','男','2'),('普通查询','123456','男','2')]
cur = conn.cursor()

cur.executemany("insert into Invoice (code, name, department, speciality, sex, invoicenumber, invoicebill, invoicecode, invoicedate) values(%s,%s,%s,%s,%s,%s,%s,%s,%s)", query)

cur.close()
conn.commit()
conn.close()