const express = require("express");
const connection = require("../connection/connection.js");

const executeQuery = (sql) => {
  return new Promise((resolve, reject) => {
    connection.query(sql, (err, result) => {
      if (err) return reject(err);
      return resolve(result);
    });
  });
};
const student = (req, res) => {
  res.render("../views/form");
};

const postStudent = async (req, res) => {
  let body = req.body;
  let {
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

  let sql = `insert into basic_details(firstname,lastname,designation,address1,email,address2,phonenumber,city,gender,relationship_status,dateofbirth,state,zipcode) values ('${first_name}','${last_name}','${_designation}','${_address1}','${_email}','${_address2}','${_phonenumber}','${_city}','${_gender}','${realtionship_status}','${_dob}','${_state}','${_zipcode}')`;

  let result = await executeQuery(sql);
  lastid = result.insertId;

  if (typeof body.nameofboard == "object") {
    let sql2 = `insert into education_details(candidate_id,coursename,passingyear,percentage) values`;

    for (let i = 0; i < body.nameofboard.length; i++) {
      sql2 += `('${lastid}','${body.nameofboard[i]}','${body.passingyear[i]}','${body.percentage[i]}'),`;
    }
    sql2 = sql2.slice(0, sql2.length - 1) + ";";

    connection.query(sql2, (err, result2) => {
      if (err) throw err;
    });
  } else if (typeof body.nameofboard == "string") {
    let sql2 = `insert into education_details(candidate_id,coursename,passingyear,percentage) values('${lastid}','${body.nameofboard}','${body.passingyear}','${body.percentage}')`;
    connection.query(sql2, (err, result2) => {
      if (err) throw err;
    });
  }

  if (typeof body.companyname == "object") {
    let sql3 = `insert into work_experience(candidate_id,company_name,designation,from_date,to_date) values`;
    for (let i = 0; i < req.body.companyname.length; i++) {
      sql3 += `('${lastid}','${body.companyname[i]}','${body.designation[i]}','${body.fromdate[i]}','${body.todate[i]}'),`;
    }
    sql3 = sql3.slice(0, sql3.length - 1) + ";";

    connection.query(sql3, (err, result3) => {
      if (err) throw err;
    });
  } else if (typeof body.companyname == "string") {
    sql3 = `insert into work_experience(candidate_id,company_name,designation,from_date,to_date) values('${lastid}','${body.companyname}','${body.designation}','${body.fromdate}','${body.todate}');`;

    connection.query(sql3, (err, result3) => {
      if (err) throw err;
    });
  }

  if (typeof body.languages == "object") {
    let sql4 = `insert into languages_known(candidate_id,language_name,lang_check)values`;
    for (let i = 0; i < body.languages.length; i++) {
      let a = body.languages[i];
      sql4 += `('${lastid}','${body.languages[i]}','${body[a]}'),`;
    }
    sql4 = sql4.slice(0, sql4.length - 1) + ";";
    connection.query(sql4, (err, result4) => {
      if (err) throw err;
    });
  } else if (typeof body.languages == "string") {
    let a = body.languages;
    let sql4 = `insert into languages_known(candidate_id,language_name,lang_check) values ('${lastid}','${body.languages}','${body[a]}');`;
    connection.query(sql4, (err, result4) => {
      if (err) throw err;
    });
  }

  if (typeof body.technology == "object") {
    let sql5 = `insert into technologies(candidate_id,language_name,ability)values`;
    for (let i = 0; i < body.technology.length; i++) {
      let a = body.technology[i];
      sql5 += `('${lastid}','${body.technology[i]}','${body[a]}'),`;
    }
    sql5 = sql5.slice(0, sql5.length - 1) + ";";
    connection.query(sql5, (err, result5) => {
      if (err) throw err;
    });
  } else if (typeof body.technology == "string") {
    let a = body.technology;
    let sql5 = `insert into technologies(candidate_id,language_name,ability)values ('${lastid}','${body.technology}','${body[a]}');`;
    connection.query(sql5, (err, result5) => {
      if (err) throw err;
    });
  }

  if (typeof body.contactname == "object") {
    let sql6 = `insert into reference_contacts(candidate_id,contact_name,contact_number,contact_relation) values`;
    for (let i = 0; i < body.contactname.length; i++) {
      sql6 += `('${lastid}','${body.contactname[i]}','${body.contactnumber[i]}','${body.contactrealtion[i]}'),`;
    }
    sql6 = sql6.slice(0, sql6.length - 1) + ";";

    connection.query(sql6, (err, result6) => {
      if (err) throw err;
    });
  } else if (typeof req.body.contactname == "string") {
    sql6 = `insert into reference_contacts(candidate_id,contact_name,contact_number,contact_relation) values ('${lastid}','${body.contactname}','${body.contactnumber}','${body.contactrealtion}');`;
    connection.query(sql6, (err, result6) => {
      if (err) throw err;
    });
  }

  if (body.location) {
    let sql7 = `insert into preferences(candidate_id,prefered_location,notice_period,department,expected_ctc,current_ctc) values ('${lastid}','${body.location}','${body.noticeperiod}','${body.department}','${body.expectedctc}','${body.currentctc}');`;
    connection.query(sql7, (err, result7) => {
      if (err) throw err;
    });
  }

  res.end("Applied succeesfully!!!! register id : " + lastid);
};

const getStudent = async (req, res) => {
  let id = req.params.id;
  let sql = `select * from basic_details where candidate_id ='${id}'`;
  let sql2 = `select * from education_details where candidate_id ='${id}'`;
  let sql3 = `select * from work_experience where candidate_id ='${id}'`;
  let sql4 = `select * from languages_known where candidate_id ='${id}'`;
  let sql5 = `select * from technologies where candidate_id ='${id}'`;
  let sql6 = `select * from reference_contacts where candidate_id ='${id}'`;
  let sql7 = `select * from preferences where candidate_id ='${id}'`;
  let getresult = await executeQuery(sql);
  let getresult2 = await executeQuery(sql2);
  let getresult3 = await executeQuery(sql3);
  let getresult4 = await executeQuery(sql4);
  let getresult5 = await executeQuery(sql5);
  let getresult6 = await executeQuery(sql6);
  let getresult7 = await executeQuery(sql7);
  res.render("../views/form_edit", {
    id: id,
    result: getresult,
    result2: getresult2,
    result3: getresult3,
    result4: getresult4,
    result5: getresult5,
    result6: getresult6,
    result7: getresult7,
  });
};

const updateStudent = async (req, res) => {
  let id = req.body.id;
  let body = req.body;

  let upadatebasic = `update basic_details
  set firstname = '${body.first_name}', lastname = '${body.last_name}', designation = '${body._designation}',address1 = '${body._address1}', email = '${body._email}', address2 = '${body._address2}',phonenumber = '${body._phonenumber}',city = '${body._city}', gender = '${body._gender}',relationship_status = '${body.realtionship_status}',dateofbirth = '${body._dob}', state = '${body._state}', zipcode = '${body._zipcode}' where candidate_id = '${id}'`;

  let basicresult = await executeQuery(upadatebasic);

  let upedu = `select id from education_details where candidate_id = '${id}';`;
  let val = await executeQuery(upedu);

  for (let i = 0; i < val.length; i++) {
    let updateedu = `update education_details 
    set coursename = '${body.nameofboard[i]}', passingyear = '${body.passingyear[i]}',
    percentage = '${body.percentage[i]}' where id = ${val[i].id};`;
    let resultedu = await executeQuery(updateedu);
  }

  let upex = `select id from work_experience where candidate_id = '${id}';`;
  let exid = await executeQuery(upex);
  for (let i = 0; i < exid.length; i++) {
    let upexp = `update work_experience set company_name = '${body.companyname[i]}', designation = '${body.designation[i]}', from_date = '${body.fromdate[i]}', to_date = '${body.todate[i]}' where id = '${exid[i].id}'`;
    let exepresult = await executeQuery(upexp);
  }

  let lang = `select id from languages_known where candidate_id = '${id}';`;
  let lagid = await executeQuery(lang);
  for (let i = 0; i < lagid.length; i++) {
    let a = body.languages[i];

    let langup = `update languages_known set language_name = '${body.languages[i]}', lang_check = '${body[a]}' where id = '${lagid[i].id}';`;
    let langresult = await executeQuery(langup);
  }

  let tech = `select id from technologies where candidate_id = '${id}';`;
  let techid = await executeQuery(tech);
  for (let i = 0; i < techid.length; i++) {
    let b = body.technology[i];
    let techup = `update technologies set language_name = '${body.technology[i]}',ability = '${body[b]}' where id = '${techid[i].id}';`;
    let techresult = await executeQuery(techup);
  }

  let refe = `select id from reference_contacts where candidate_id = '${id}';`;
  let refid = await executeQuery(refe);
  for (let i = 0; i < refid.length; i++) {
    let upref = `update reference_contacts set contact_name = '${body.contactname[i]}', contact_number = '${body.contactnumber[i]}', contact_relation = '${body.contactrealtion[i]}' where id = '${refid[i].id}'`;
    let refresult = await executeQuery(upref);
  }

  let upapref = `update preferences
  set prefered_location = '${body.location}', notice_period = '${body.noticeperiod}', department = '${body.department}',expected_ctc = '${body.expectedctc}', current_ctc = '${body.currentctc}' where candidate_id = '${id}'`;

  let prefresult = await executeQuery(upapref);
  res.end("update");
};

module.exports = { student, postStudent, getStudent, updateStudent };
