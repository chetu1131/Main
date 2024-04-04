require("dotenv").config();
const express = require("express");
const crypto = require("crypto");
const router = express.Router();
const ShortUniqueId = require("short-unique-id");
const uid = new ShortUniqueId();
const jwt = require("jsonwebtoken");
const verifyToken = require("../middleware/authMiddleware.js");
let secret_key = process.env.SECRET_KEY;
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
  return new Promise(async (resolve, reject) => {
    let body = req.body;
    if (!body) {
      res.status(400).send("All input is required");
    }

    let password = body.password;
    let salt = Math.random().toString(36).slice(2, 6);
    password += salt;

    let token = Math.random().toString(36).slice(2);

    let md5sum = crypto
      .createHash("md5")
      .update(password.toString())
      .digest("hex");

    let sql = `insert into users (first_name,email,phone_number,user_password,salt,token)
    values('${body.firstname}','${body.email}','${body.phonenumber}','${md5sum}','${salt}','${token}');`;

    let result = await executeQuery(sql);
    lastid = result.insertId;
    return resolve(res.json({ id: lastid, token: token }));
  });
});

router.get("/data", verifyToken, async (req, res) => {
  //token generation and all-----
  let id = req.query.id;
  let token = req.query.token;
  let sql2 = `select * from users where id = '${id}';`;
  let result3 = await executeQuery(sql2);
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
    let sql = `update users set isvalid = 1 where id = '${id}'`;
    let result = await executeQuery(sql);

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
});

router.get("/", (req, res) => {
  res.render("login");
});
router.post("/login", async (req, res) => {
  let data = req.body;

  if (data.email && data.password) {
    let sql = `select count(*) as counter from users where email = '${data.email}';`;
    let result = await executeQuery(sql);
    if (result[0].counter == 1) {
      let salt = `select * from users;`;
      let result2 = await executeQuery(salt);
      let password = data.password;
      password += result2[0].salt;
      let md5sum = crypto
        .createHash("md5")
        .update(password.toString())
        .digest("hex");
      let id = result2[0].id;
      if (md5sum == result2[0].user_password) {
        let token = jwt.sign({ id: id }, secret_key);

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
  let code = uid.rnd(12);
  let email = req.body.email;
  let sql = `update users set token ='${code}', reg_date = current_timestamp where email = '${email}';`;
  let result = await executeQuery(sql);
  let sql2 = `select id from users where email='${email}';`;
  let result2 = await executeQuery(sql2);
  res.send({ code: code });
});

router.get("/checkemail/:email", async (req, res) => {
  let email = req.params.email;
  let sql = `select count(*) as counter from users where email='${email}';`;
  let result = await executeQuery(sql);
  let exists = result[0].counter >= 1;
  res.send(exists);
});

router.get("/forgotpass2", async (req, res) => {
  let token = req.query.code;
  q = `select id from users where token='${token}';`;
  let result = await executeQuery(q);
  res.render("forgotpass", { id: result[0].id });
});

router.post("/newpass", async (req, res) => {
  let password = req.body.password;
  let id = req.body.id;

  let salt = `select * from users where id = '${id}';`;
  let result2 = await executeQuery(salt);
  password += result2[0].salt;
  //   password = bcrypt.hash(password, salt)
  let md5sum = crypto
    .createHash("md5")
    .update(password.toString())
    .digest("hex");

  let sql = `update users set user_password = '${md5sum}' where id = '${id}';`;
  let result = await executeQuery(sql);
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
  const sessionCookie = req.cookies.auth;
  res.clearCookie("auth").redirect("/");
});
module.exports = router;
