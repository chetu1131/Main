const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const connection = require("../connection/connection");
app.use(bodyParser.urlencoded({ extended: false }));
app.set("view engine", "ejs");
const executeQuery = (sql) => {
  return new Promise((resolve, reject) => {
    connection.query(sql, (err, result) => {
      if (err) return reject(err);
      return resolve(result);
    });
  });
};

const ajax = (req, res) => {
  try {
    console.log("in /  ajax get");
    id = req.query.id;
    res.render("../views/ajaxcrud", { id: id });
  } catch (error) {
    return error;
  }
};

const ajaxPost = async (req, res) => {
  return new Promise(async (resolve, reject) => {
    console.log("/ post");
    try {
      let body = req.body;
      console.log(body);
      if (body.id == "" || body.id == null) {
        console.log("hello");
        let sql = `insert into basic_details(firstname,lastname,designation,address1,email,address2,phonenumber,city,gender,relationship_status,dateofbirth,state,zipcode) values ('${body.first_name}','${body.last_name}','${body._designation}','${body._address1}','${body._email}','${body._address2}','${body._phonenumber}','${body._city}','${body._gender}','${body.realtionship_status}','${body._dob}','${body._state}','${body._zipcode}')`;

        let result = await executeQuery(sql);
        console.log(sql);
        lastid = result.insertId;

        if (typeof body.nameofboard == "object") {
          let sql2 = `insert into education_details(candidate_id,coursename,passingyear,percentage) values`;

          for (let i = 0; i < body.nameofboard.length; i++) {
            sql2 += `('${lastid}','${body.nameofboard[i]}','${body.passingyear[i]}','${body.percentage[i]}'),`;
          }
          sql2 = sql2.slice(0, sql2.length - 1) + ";";

          connection.query(sql2, (err, result2) => {
            if (err) throw err;
            console.log(result2);
          });
        } else if (typeof body.nameofboard == "string") {
          let sql2 = `insert into education_details(candidate_id,coursename,passingyear,percentage) values('${lastid}','${body.nameofboard}','${body.passingyear}','${body.percentage}')`;
          connection.query(sql2, (err, result2) => {
            if (err) throw err;
            console.log(result2);
          });
        }

        if (typeof body.companyname == "object") {
          let sql3 = `insert into work_experience(candidate_id,company_name,designation,from_date,to_date) values`;
          for (let i = 0; i < req.body.companyname.length; i++) {
            sql3 += `('${lastid}','${body.companyname[i]}','${body.designations[i]}','${body.fromdate[i]}','${body.todate[i]}'),`;
          }
          sql3 = sql3.slice(0, sql3.length - 1) + ";";

          connection.query(sql3, (err, result3) => {
            if (err) throw err;
            console.log(result3);
          });
        } else if (typeof body.companyname == "string") {
          sql3 = `insert into work_experience(candidate_id,company_name,designation,from_date,to_date) values('${lastid}','${body.companyname}','${body.designations}','${body.fromdate}','${body.todate}');`;

          connection.query(sql3, (err, result3) => {
            if (err) throw err;
            console.log(result3);
          });
        }

        if (typeof body.languages == "object" && body.languages.length != 0) {
          let sql4 = `insert into languages_known(candidate_id,language_name,lang_check)values`;
          for (let i = 0; i < body.languages.length; i++) {
            let a = body.languages[i];
            console.log("at simple post object " + a);
            sql4 += `('${lastid}','${body.languages[i]}','${body[a]}'),`;
          }
          sql4 = sql4.slice(0, sql4.length - 1) + ";";
          connection.query(sql4, (err, result4) => {
            if (err) throw err;

            console.log(result4);
          });
        } else if (
          typeof body.languages == "string" &&
          body.languages.length != 0
        ) {
          let a = body.languages;
          if (body.a.length != 0) {
            console.log("simple post string" + a);
            let sql4 = `insert into languages_known(candidate_id,language_name,lang_check) values ('${lastid}','${body.languages}','${body.a}');`;
          }
          connection.query(sql4, (err, result4) => {
            if (err) throw err;
            console.log(result4);
          });
        }

        if (typeof body.technology == "object") {
          let sql5 = `insert into technologies(candidate_id,language_name,ability)values`;
          for (let i = 0; i < body.technology.length; i++) {
            let a = body.technology[i];
            console.log("tech" + a);
            sql5 += `('${lastid}','${body.technology[i]}','${body[a]}'),`;
          }
          sql5 = sql5.slice(0, sql5.length - 1) + ";";
          connection.query(sql5, (err, result5) => {
            if (err) throw err;
            console.log(sql5);
          });
        } else if (typeof body.technology == "string") {
          let a = body.technology;
          console.log(a);
          let sql5 = `insert into technologies(candidate_id,language_name,ability)values ('${lastid}','${body.technology}','${body[a]}');`;
          connection.query(sql5, (err, result5) => {
            if (err) throw err;
            console.log(result5);
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
          let sql7 = `insert into preferences(candidate_id,prefered_location,notice_period,department,expected_ctc,current_ctc) values ('${lastid}','${body.location}','${body.noticeperiod}','${body.department}','${body.expectedctc}','${body.currentctc}');`;
          connection.query(sql7, (err, result7) => {
            if (err) throw err;
            console.log(result7);
          });
        }
        console.log(lastid);
        res.send("register succeesfully!!!! register id : " + lastid);
      } else {
        console.log("/id post");
        let body = req.body;
        let id = body.id;
        console.log("body id " + id);
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
        console.log(exid.length);
        for (let i = 0; i < exid.length; i++) {
          let upexp = `update work_experience set company_name = '${body.companyname[i]}', designation = '${body.designations[i]}', from_date = '${body.fromdate[i]}', to_date = '${body.todate[i]}' where id = '${exid[i].id}'`;
          let exepresult = await executeQuery(upexp);
        }

        if (typeof body.languages == "object" && body.languages.length != 0) {
          let lang = `select id from languages_known where candidate_id = '${id}';`;
          let lagid = await executeQuery(lang);
          console.log("LAGID ID " + typeof lagid);
          console.log("object langauage");
          console.log("lang length" + body.languages.length);
          if (lagid && id) {
            for (let i = 0; i < body.languages.length; i++) {
              let a = body.languages[i];

              console.log("checked lang " + a + i);
              console.log(body.languages[2]);
              let langup = `update languages_known set language_name = '${body.languages[i]}', lang_check = '${body[a]}' where id = '${lagid[i].id}';`;
              let langresult = await executeQuery(langup);
              console.log(langup);
              console.log(langresult);
            }
          }
        } else if (
          typeof body.languages == "string" &&
          body.languages.length != 0
        ) {
          console.log("string language");
          let a = body.languages;
          console.log("body of a " + a);
          let langup = `update languages_known set language_name = '${body.languages}', lang_check = '${body[a]}' where candidate_id = '${id}';`;
          let langresult = await executeQuery(langup);
          console.log(langup);
          console.log(langresult);
        }

        if (typeof body.technology == "object" && body.technology.length != 0) {
          let tech = `select id from technologies where candidate_id = '${id}';`;
          let techid = await executeQuery(tech);
          for (let i = 0; i < body.technology.length; i++) {
            console.log("object tech");
            let b = body.technology[i];
            let techup = `update technologies set language_name = '${body.technology[i]}',ability = '${body[b]}' where id = '${techid[i].id}';`;
            let techresult = await executeQuery(techup);
            console.log(b);
            console.log(techup, techresult);
          }
        } else if (
          typeof body.technology == "string" &&
          body.technology.length != 0
        ) {
          console.log("tech string");
          let b = body.technology;
          console.log(b);
          let techup = `update technologies set language_name = '${body.technology}',ability = '${body[b]}' where candidate_id = '${id}';`;
          let techresult = await executeQuery(techup);
          console.log(techresult);
        }

        let refe = `select id from reference_contacts where candidate_id = '${id}';`;
        let refid = await executeQuery(refe);
        for (let i = 0; i < refid.length; i++) {
          let upref = `update reference_contacts set contact_name = '${body.contactname[i]}', contact_number = '${body.contactnumber[i]}', contact_relation = '${body.contactrealtion[i]}' where id = '${refid[i].id}'`;
          let refresult = await executeQuery(upref);
          // console.log(refresult,upref);
        }

        let upapref = `update preferences
    set prefered_location = '${body.location}', notice_period = '${body.noticeperiod}', department = '${body.department}',expected_ctc = '${body.expectedctc}', current_ctc = '${body.currentctc}' where candidate_id = '${id}'`;

        let prefresult = await executeQuery(upapref);
        console.log(prefresult);
        res.send("Update successfully " + body.id);
      }
      res.redirect("/");
    } catch (error) {
      return reject(res.json(err.message));
    }
  });
};

const ajaxData = async (req, res) => {
  console.log("hello");
  return new Promise(async (resolve, reject) => {
    console.log("id get");
    let id = req.query.id;
    console.log(id);
    try {
      if (id && id != "favicon.ico") {
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
        let getresult5 = await executeQuery(sql5);
        let getresult4 = await executeQuery(sql4);
        let getresult6 = await executeQuery(sql6);
        let getresult7 = await executeQuery(sql7);
        console.log(sql, getresult);
        return resolve(
          res.send({
            id: id,
            result: getresult,
            result2: getresult2,
            result3: getresult3,
            result4: getresult4,
            result5: getresult5,
            result6: getresult6,
            result7: getresult7,
          })
        );
      } else {
        res.send("User not Found");
      }
    } catch (err) {
      return reject(res.json(err.message));
    }
  });
};

module.exports = { ajax, ajaxPost, ajaxData };
