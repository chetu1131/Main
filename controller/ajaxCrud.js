const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const connection = require("../connection/connection");
app.use(bodyParser.urlencoded({ extended: false }));
app.set("view engine", "ejs");
const executeQuery = (sql) => {
  return new Promise((resolve, reject) => {
    connection.query(sql, values, (err, result) => {
      if (err) return reject(err);
      return resolve(result);
    });
  });
};

const ajax = (req, res) => {
  try {
    id = req.query.id;
    res.render("../views/ajaxcrud", { id: id });
  } catch (error) {
    return error;
  }
};

const ajaxPost = async (req, res) => {
  return new Promise(async (resolve, reject) => {
    try {
      let body = req.body;
      if (body.id == "" || body.id == null) {
        let basicSql = ` INSERT INTO basic_details (firstname, lastname, designation, address1, email, address2, phonenumber, city, gender, relationship_status, dateofbirth, state, zipcode) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

        let basicValues = [
          body.first_name,
          body.last_name,
          body._designation,
          body._address1,
          body._email,
          body._address2,
          body._phonenumber,
          body._city,
          body._gender,
          body.relationship_status,
          body._dob,
          body._state,
          body._zipcode,
        ];
        let basicResult = await executeQuery(basicSql, basicValues);
        let candidateId = basicResult.insertId;

        for (let i = 0; i < body.nameofboard.length; i++) {
          let eduSql = `INSERT INTO education_details (candidate_id, coursename, passingyear, percentage)
          VALUES (?, ?, ?, ?)`;
          const eduValues = [
            candidateId,
            body.nameofboard[i],
            body.passingyear[i],
            body.percentage[i],
          ];
          await executeQuery(eduSql, eduValues);
        }

        for (let i = 0; i < body.companyname.length; i++) {
          let workSql = `INSERT INTO work_experience (candidate_id, company_name, designation, from_date, to_date)
          VALUES (?, ?, ?, ?, ?)`;
          const workValues = [
            candidateId,
            body.companyname[i],
            body.designations[i],
            body.fromdate[i],
            body.todate[i],
          ];
          await executeQuery(workSql, workValues);
        }

        for (let i = 0; i < body.languages.length; i++) {
          const LanguageSql = `INSERT INTO languages_known (candidate_id, language_name, lang_check)
          VALUES (?, ?, ?)`;
          const LanguageValues = [
            candidateId,
            body.languages[i],
            body.languageChecks[i],
          ];
          await executeQuery(LanguageSql, LanguageValues);
        }

        for (let i = 0; i < body.technology.length; i++) {
          const techSql = `INSERT INTO technologies (candidate_id, language_name, ability)
          VALUES (?, ?, ?)`;
          const techValues = [
            candidateId,
            body.technology[i],
            body.technologyAbilities[i],
          ];
          await executeQuery(techSql, techValues);
        }

        for (let i = 0; i < body.contactname.length; i++) {
          const contactSql = `INSERT INTO reference_contacts (candidate_id, contact_name, contact_number, contact_relation)
          VALUES (?, ?, ?, ?)`;
          const contactValues = [
            candidateId,
            body.contactname[i],
            body.contactnumber[i],
            body.contactrealtion[i],
          ];
          await executeQuery(contactSql, contactValues);
        }

        const preferenceSql = `INSERT INTO preferences (candidate_id, prefered_location, notice_period, department, expected_ctc, current_ctc)
        VALUES (?, ?, ?, ?, ?, ?)`;

        const preferenceValues = [
          candidateId,
          body.location,
          body.noticeperiod,
          body.department,
          body.expectedctc,
          body.currentctc,
        ];

        await executeQuery(preferenceSql, preferenceValues);
      } else {
        const basicUpdate = `UPDATE basic_details
        SET firstname = ?, lastname = ?, designation = ?, address1 = ?,
            email = ?, address2 = ?, phonenumber = ?, city = ?, gender = ?,
            relationship_status = ?, dateofbirth = ?, state = ?, zipcode = ?
        WHERE candidate_id = ?`;

        const basicValuesUpdate = [
          body.first_name,
          body.last_name,
          body._designation,
          body._address1,
          body._email,
          body._address2,
          body._phonenumber,
          body._city,
          body._gender,
          body.relationship_status,
          body._dob,
          body._state,
          body._zipcode,
          body.id,
        ];
        await executeQuery(basicUpdate, basicValuesUpdate);

        let upedu = `select id from education_details where candidate_id = ?;`;
        let val = await executeQuery(upedu, body.id);

        for (let i = 0; i < body.nameofboard.length; i++) {
          const eduUpdate = `UPDATE education_details
          SET coursename = ?, passingyear = ?, percentage = ?
          WHERE candidate_id = ? AND id = ?`;
          const eduUpdateValues = [
            body.nameofboard[i],
            body.passingyear[i],
            body.percentage[i],
            val, // Assuming you have an educationId array in req.body
            candidateId,
          ];
          await executeQuery(eduUpdate, eduUpdateValues);
        }
  
        let upex = `select id from work_experience where candidate_id = ?;`;
        let exid = await executeQuery(upex, body.id);

        for (let i = 0; i < exid.length; i++) {
          let upexp = `update work_experience set company_name = '${body.companyname[i]}', designation = '${body.designations[i]}', from_date = '${body.fromdate[i]}', to_date = '${body.todate[i]}' where id = '${exid[i].id}'`;
          let exepresult = await executeQuery(upexp);
        }

        if (typeof body.languages == "object" && body.languages.length != 0) {
          let lang = `select id from languages_known where candidate_id = '${id}';`;
          let lagid = await executeQuery(lang);

          if (lagid && id) {
            for (let i = 0; i < body.languages.length; i++) {
              let a = body.languages[i];

              let langup = `update languages_known set language_name = '${body.languages[i]}', lang_check = '${body[a]}' where id = '${lagid[i].id}';`;
              let langresult = await executeQuery(langup);
            }
          }
        } else if (
          typeof body.languages == "string" &&
          body.languages.length != 0
        ) {
          let a = body.languages;
          let langup = `update languages_known set language_name = '${body.languages}', lang_check = '${body[a]}' where candidate_id = '${id}';`;
          let langresult = await executeQuery(langup);
        }

        if (typeof body.technology == "object" && body.technology.length != 0) {
          let tech = `select id from technologies where candidate_id = '${id}';`;
          let techid = await executeQuery(tech);
          for (let i = 0; i < body.technology.length; i++) {
            let b = body.technology[i];
            let techup = `update technologies set language_name = '${body.technology[i]}',ability = '${body[b]}' where id = '${techid[i].id}';`;
            let techresult = await executeQuery(techup);
          }
        } else if (
          typeof body.technology == "string" &&
          body.technology.length != 0
        ) {
          let b = body.technology;
          let techup = `update technologies set language_name = '${body.technology}',ability = '${body[b]}' where candidate_id = '${id}';`;
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
      }
    } catch (error) {
      return reject(res.json(error.message));
    }
  });
};

const ajaxData = async (req, res) => {
  return new Promise(async (resolve, reject) => {
    let id = req.query.id;
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
