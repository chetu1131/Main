const express = require("express");
const mysql = require("mysql");
const app = express();
const router = express.Router();
const verifyToken = require("../middleware/authMiddleware.js");

// var bodyParser = require("body-parser");

//middlewares
app.set("view engine", "ejs");

const connection = require("../connection");

router.get("/student",verifyToken, (req, res) => {
  res.render(__dirname+"/views/form");
});

const executeQuery = (sql) => {
  return new Promise((resolve, reject) => {
    connection.query(sql, (err, result) => {
      if (err) return reject(err);
      return resolve(result);
    });
  });
};

router.post("/student",verifyToken, async (req, res) => {
  var body = req.body;
  var {
    first_name,
    last_name,
    _designation,
    _address1,
    _email,
    _address2,
    _city,
    _gender,
    _state,
    realtionship_status,
    _dob,
    _zipcode,
    _phonenumber,
  } = req.body;
  console.log(_address2);

  var sql = `insert into basic_details(firstname,lastname,designation,address1,email,address2,phonenumber,city,gender,relationship_status,dateofbirth,state,zipcode) values ('${first_name}','${last_name}','${_designation}','${_address1}','${_email}','${_address2}','${_phonenumber}','${_city}','${_gender}','${realtionship_status}','${_dob}','${_state}','${_zipcode}')`;

  var result = await executeQuery(sql);

  lastid = result.insertId;

  if (typeof body.nameofboard == "object") {
    var sql2 = `insert into education_details(candidate_id,coursename,passingyear,percentage) values`;

    for (var i = 0; i < body.nameofboard.length; i++) {
      sql2 += `('${lastid}','${body.nameofboard[i]}','${body.passingyear[i]}','${body.percentage[i]}'),`;
    }
    sql2 = sql2.slice(0, sql2.length - 1) + ";";

    connection.query(sql2, (err, result2) => {
      if (err) throw err;
      console.log(result2);
    });
  } else if (typeof body.nameofboard == "string") {
    var sql2 = `insert into education_details(candidate_id,coursename,passingyear,percentage) values('${lastid}','${body.nameofboard}','${body.passingyear}','${body.percentage}')`;
    connection.query(sql2, (err, result2) => {
      if (err) throw err;
      console.log(result2);
    });
  }

  if (typeof body.companyname == "object") {
    var sql3 = `insert into work_experience(candidate_id,company_name,designation,from_date,to_date) values`;
    for (var i = 0; i < req.body.companyname.length; i++) {
      sql3 += `('${lastid}','${body.companyname[i]}','${body.designation[i]}','${body.fromdate[i]}','${body.todate[i]}'),`;
    }
    sql3 = sql3.slice(0, sql3.length - 1) + ";";

    connection.query(sql3, (err, result3) => {
      if (err) throw err;
      console.log(result3);
    });
  } else if (typeof body.companyname == "string") {
    sql3 = `insert into work_experience(candidate_id,company_name,designation,from_date,to_date) values('${lastid}','${body.companyname}','${body.designation}','${body.fromdate}','${body.todate}');`;

    connection.query(sql3, (err, result3) => {
      if (err) throw err;
      console.log(result3);
    });
  }

  if (typeof body.languages == "object") {
    var sql4 = `insert into languages_known(candidate_id,language_name,lang_check)values`;
    for (var i = 0; i < body.languages.length; i++) {
      var a = body.languages[i];
      sql4 += `('${lastid}','${body.languages[i]}','${body[a]}'),`;
    }
    sql4 = sql4.slice(0, sql4.length - 1) + ";";
    connection.query(sql4, (err, result4) => {
      if (err) throw err;
      console.log(result4);
      console.log(result4);
    });
  } else if (typeof body.languages == "string") {
    var a = body.languages;
    console.log(a);
    var sql4 = `insert into languages_known(candidate_id,language_name,lang_check) values ('${lastid}','${body.languages}','${body[a]}');`;
    connection.query(sql4, (err, result4) => {
      if (err) throw err;
      console.log(result4);
    });
  }

  if (typeof body.technology == "object") {
    var sql5 = `insert into technologies(candidate_id,language_name,ability)values`;
    for (var i = 0; i < body.technology.length; i++) {
      var a = body.technology[i];
      sql5 += `('${lastid}','${body.technology[i]}','${body[a]}'),`;
    }
    sql5 = sql5.slice(0, sql5.length - 1) + ";";
    connection.query(sql5, (err, result5) => {
      if (err) throw err;
      console.log(sql5);
    });
  } else if (typeof body.technology == "string") {
    var a = body.technology;
    console.log(a);
    var sql5 = `insert into technologies(candidate_id,language_name,ability)values ('${lastid}','${body.technology}','${body[a]}');`;
    connection.query(sql5, (err, result5) => {
      if (err) throw err;
      console.log(result5);
    });
  }

  if (typeof body.contactname == "object") {
    var sql6 = `insert into reference_contacts(candidate_id,contact_name,contact_number,contact_relation) values`;
    for (var i = 0; i < body.contactname.length; i++) {
      sql6 += `('${lastid}','${body.contactname[i]}','${body.contactnumber[i]}','${body.contactrealtion[i]}'),`;
    }
    sql6 = sql6.slice(0, sql6.length - 1) + ";";

    connection.query(sql6, (err, result6) => {
      if (err) throw err;
      console.log(result6);
    });
  } else if (typeof req.body.contactname == "string") {
    sql6 = `insert into reference_contacts(candidate_id,contact_name,contact_number,contact_relation) values ('${lastid}','${body.contactname}','${body.contactnumber}','${body.contactrealtion}');`;
    connection.query(sql6, (err, result6) => {
      if (err) throw err;
      console.log(result6);
    });
  }

  if (body.location) {
    var sql7 = `insert into preferences(candidate_id,prefered_location,notice_period,department,expected_ctc,current_ctc) values ('${lastid}','${body.location}','${body.noticeperiod}','${body.department}','${body.expectedctc}','${body.currentctc}');`;
    connection.query(sql7, (err, result7) => {
      if (err) throw err;
      console.log(result7);
    });
  }

  res.end("register succeesfully!!!! register id : " + lastid);
});

router.get("/student/:id",verifyToken, async (req, res) => {
  var id = req.params.id;
  var sql = `select * from basic_details where candidate_id ='${id}'`;
  var sql2 = `select * from education_details where candidate_id ='${id}'`;
  var sql3 = `select * from work_experience where candidate_id ='${id}'`;
  var sql4 = `select * from languages_known where candidate_id ='${id}'`;
  var sql5 = `select * from technologies where candidate_id ='${id}'`;
  var sql6 = `select * from reference_contacts where candidate_id ='${id}'`;
  var sql7 = `select * from preferences where candidate_id ='${id}'`;
  var getresult = await executeQuery(sql);
  var getresult2 = await executeQuery(sql2);
  var getresult3 = await executeQuery(sql3);
  var getresult4 = await executeQuery(sql4);
  var getresult5 = await executeQuery(sql5);
  var getresult6 = await executeQuery(sql6);
  var getresult7 = await executeQuery(sql7);
  res.render(__dirname+"/views/form_edit", {
    id: id,
    result: getresult,
    result2: getresult2,
    result3: getresult3,
    result4: getresult4,
    result5: getresult5,
    result6: getresult6,
    result7: getresult7,
  });
});

router.post("/student/id",verifyToken, async (req, res) => {
  var id = req.body.id;
  var body = req.body;

  var upadatebasic = `update basic_details
  set firstname = '${body.first_name}', lastname = '${body.last_name}', designation = '${body._designation}',address1 = '${body._address1}', email = '${body._email}', address2 = '${body._address2}',phonenumber = '${body._phonenumber}',city = '${body._city}', gender = '${body._gender}',relationship_status = '${body.realtionship_status}',dateofbirth = '${body._dob}', state = '${body._state}', zipcode = '${body._zipcode}' where candidate_id = '${id}'`;

  var basicresult = await executeQuery(upadatebasic);

  var upedu = `select id from education_details where candidate_id = '${id}';`;
  var val = await executeQuery(upedu);

  for (var i = 0; i < val.length; i++) {
    var updateedu = `update education_details 
    set coursename = '${body.nameofboard[i]}', passingyear = '${body.passingyear[i]}',
    percentage = '${body.percentage[i]}' where id = ${val[i].id};`;
    var resultedu = await executeQuery(updateedu);
  }

  var upex = `select id from work_experience where candidate_id = '${id}';`;
  var exid = await executeQuery(upex);
  for (var i = 0; i < exid.length; i++) {
    var upexp = `update work_experience set company_name = '${body.companyname[i]}', designation = '${body.designation[i]}', from_date = '${body.fromdate[i]}', to_date = '${body.todate[i]}' where id = '${exid[i].id}'`;
    var exepresult = await executeQuery(upexp);
  }

  var lang = `select id from languages_known where candidate_id = '${id}';`;
  var lagid = await executeQuery(lang);
  for (var i = 0; i < lagid.length; i++) {
    var a = body.languages[i];
    console.log(a);

    var langup = `update languages_known set language_name = '${body.languages[i]}', lang_check = '${body[a]}' where id = '${lagid[i].id}';`;
    var langresult = await executeQuery(langup);
    // console.log(langup);
    // console.log(langresult);
  }

  var tech = `select id from technologies where candidate_id = '${id}';`;
  var techid = await executeQuery(tech);
  for (var i = 0; i < techid.length; i++) {
    var b = body.technology[i];
    console.log(b);
    var techup = `update technologies set language_name = '${body.technology[i]}',ability = '${body[b]}' where id = '${techid[i].id}';`;
    var techresult = await executeQuery(techup);
    // console.log(techup,techresult);
  }

  var refe = `select id from reference_contacts where candidate_id = '${id}';`;
  var refid = await executeQuery(refe);
  for (var i = 0; i < refid.length; i++) {
    var upref = `update reference_contacts set contact_name = '${body.contactname[i]}', contact_number = '${body.contactnumber[i]}', contact_relation = '${body.contactrealtion[i]}' where id = '${refid[i].id}'`;
    var refresult = await executeQuery(upref);
    // console.log(refresult,upref);
  }

  var upapref = `update preferences
  set prefered_location = '${body.location}', notice_period = '${body.noticeperiod}', department = '${body.department}',expected_ctc = '${body.expectedctc}', current_ctc = '${body.currentctc}' where candidate_id = '${id}'`;

  var prefresult = await executeQuery(upapref);
  console.log(prefresult);
  res.end("update");
});

 module.exports = router;