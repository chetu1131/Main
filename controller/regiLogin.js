require("dotenv").config();
const express = require("express");
const crypto = require("crypto");
const router = express.Router();
const ShortUniqueId = require("short-unique-id");
const uid = new ShortUniqueId();
const jwt = require("jsonwebtoken");
const verifyToken = require("../middleware/authMiddleware.js");
var secret_key = process.env.SECRET_KEY;
// console.log("secret key: " + secret_key);
const connection = require("../connection/connection.js");

const executeQuery = (sql) => {
  return new Promise((resolve, reject) => {
    connection.query(sql, (err, result) => {
      if (err) return reject(err);
      return resolve(result);
    });
  });
};

router.get("/register", (req, res) => {
  res.render("registration");
});
router.post("/register", async (req, res) => {
  console.log("in post");
  return new Promise(async (resolve, reject) => {
    var body = req.body;
    console.log(body);
    // validate user input
    if (!body) {
      res.status(400).send("All input is required");
    }

    // data sent to database
    var password = body.password;
    var salt = Math.random().toString(36).slice(2, 6);
    password += salt;

    // generate token
    var token = Math.random().toString(36).slice(2);

    //   password = bcrypt.hash(password, salt)
    var md5sum = crypto
      .createHash("md5")
      .update(password.toString())
      .digest("hex");

    console.log("md 5  is " + md5sum, "type of md5 : " + typeof md5sum);

    var sql = `insert into users (first_name,email,phone_number,user_password,salt,token)
    values('${body.firstname}','${body.email}','${body.phonenumber}','${md5sum}','${salt}','${token}');`;

    var result = await executeQuery(sql);
    console.log(sql, result);
    lastid = result.insertId;
    console.log(lastid);
    // token and user id pass to front end
    return resolve(res.json({ id: lastid, token: token }));
    // set time out for valid the session
  });
});

router.get("/data", verifyToken, async (req, res) => {
  //token generation and all-----
  var id = req.query.id;
  var token = req.query.token;
  console.log("token is : " + token);
  var sql2 = `select * from users where id = '${id}';`;
  var result3 = await executeQuery(sql2);
  console.log(result3);
  if (result3[0].token != token) {
    res.send(`<html lang="en">
        <head>
          <title> Registration form with Node.js, Express.js and MySQL</title>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>
        <body>
          <div class="container">
              <center>
                  <h3 class="text-danger">Invalid Credentials</h3>
                  <a href="/">Try again</a>
              </center>
          </div>
        </body>
      </html>`);
  } else {
    var sql = `update users set isvalid = 1 where id = '${id}'`;
    var result = await executeQuery(sql);
    console.log(result);

    res.send(`<html lang="en">
    <head>
      <title> Registration form with Node.js, Express.js and MySQL</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
      <div class="container">
          <center>
              <h3 class="text-success">Registration SuccessFull</h3>
            <p>Thank You !!</p>
            <a href="/">Login</a>
          </center>
      </div>
    </body>
  </html>`);
  }
  console.log(result3);
});

router.get("/", (req, res) => {
  console.log("/get");
  res.render("login");
});
router.post("/login", async (req, res) => {
  console.log("in login post ");
  var data = req.body;
  console.log(data);

  if (data.email && data.password) {
    var sql = `select count(*) as counter from users where email = '${data.email}';`;
    var result = await executeQuery(sql);
    if (result[0].counter == 1) {
      var salt = `select * from users;`;
      var result2 = await executeQuery(salt);
      var password = data.password;
      console.log(data.password);
      password += result2[0].salt;
      console.log("password plus salt " + password);
      //   password = bcrypt.hash(password, salt)
      var md5sum = crypto
        .createHash("md5")
        .update(password.toString())
        .digest("hex");
      console.log(md5sum, +"  " + result2[0].user_password);
      var id = result2[0].id;
      console.log(id);
      if (md5sum == result2[0].user_password) {
        var token = jwt.sign({ id: id }, secret_key);
        console.log("password match");
        console.log("token is  " + token);
        res
          .cookie("auth", token, { httpOnly: true, sameSite: "Strict" })
          .send({ msg: "login" });
        // .redirect("http://localhost:8000/home");
      } else {
        res.send({ msg: "invalid" });
      }
    } else {
      res.send({ msg: "invalid" });
    }
  } else {
    res.send({ msg: "invalid" });
  }
});

router.get("/forgotpass", (req, res) => {
  res.render("email");
});

router.post("/getemail", async (req, res) => {
  console.log(
    "get email and upadte token and current time stamp of that email id"
  );
  var code = uid.rnd(12);
  console.log(code);
  var email = req.body.email;
  console.log(email);
  var sql = `update users set token ='${code}', reg_date = current_timestamp where email = '${email}';`;
  var result = await executeQuery(sql);
  var sql2 = `select id from users where email='${email}';`;
  var result2 = await executeQuery(sql2);
  console.log(sql, result2);
  res.send({ code: code });
  // 1.generate 12 digits connected
  // 2. get the email from body
  // 3. write a quiery for update and update the activation code and created time current time stamp default
});

router.get("/checkemail/:email", async (req, res) => {
  console.log("email exists or not");
  var email = req.params.email;
  console.log(email);
  var sql = `select count(*) as counter from users where email='${email}';`;
  var result = await executeQuery(sql);
  var exists = result[0].counter >= 1;
  console.log(exists);
  res.send(exists);
});

router.get("/forgotpass2", async (req, res) => {
  var token = req.query.code;
  q = `select id from users where token='${token}';`;
  var result = await executeQuery(q);
  res.render("forgotpass", { id: result[0].id });
});

router.post("/newpass", async (req, res) => {
  console.log("in new password");
  var password = req.body.password;
  var id = req.body.id;
  console.log(password, id);

  var salt = `select * from users where id = '${id}';`;
  var result2 = await executeQuery(salt);
  password += result2[0].salt;
  //   password = bcrypt.hash(password, salt)
  var md5sum = crypto
    .createHash("md5")
    .update(password.toString())
    .digest("hex");

  console.log("md 5  is " + md5sum, "type of md5 : " + typeof md5sum);

  var sql = `update users set user_password = '${md5sum}' where id = '${id}';`;
  var result = await executeQuery(sql);
  console.log(sql, result);
  res.send(`<html lang="en">
  <head>
    <title> Registration form with Node.js, Express.js and MySQL</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
    <div class="container">
        <center>
            <h3 class="text-success">Password Changed</h3>
            <a href="/">Login</a>
        </center>
    </div>
  </body>
</html>`);
});

router.get("/logout", (req, res) => {
  console.log("log out");
  const sessionCookie = req.cookies.auth;
  console.log("cookie from browser: " + sessionCookie);
  res.clearCookie("auth").redirect("/");
});
module.exports = router;
