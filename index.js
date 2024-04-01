require("dotenv").config();
const express = require("express");
const crypto = require("crypto");
const cors = require("cors");
const app = express();
var bodyParser = require("body-parser");
const ShortUniqueId = require("short-unique-id");
const uid = new ShortUniqueId();
const jwt = require("jsonwebtoken");
const cookieParser = require("cookie-parser");
const path = require("path");

const PORT = process.env.PORT || 8000;
const hostName = "localhost";

var secret_key = process.env.SECRET_KEY;
console.log("secret key: " + secret_key);

const connection = require("./connection");
const verifyToken = require("./middleware/authMiddleware.js");
// const userdetail = require("./22-02-2024_student_master_getalldetails_grid/App.js");
const deliSearch = require("./controller/delisearch.js");
const dymcGrid = require("./controller/dynamicgrid.js");
const fetchapi_task = require("./controller/fetchapi.js");
const citystate = require("./controller/citystate.js");
const simpleCurd = require("./controller/simplecurd.js");
const exammaster = require("./controller/exammaster.js");
const attedancemaster = require("./controller/attendancemaster.js");
const ajaxcurd = require("./controller/ajaxcurd.js");
const clockconvertor = require("./controller/clock.js");

app.use(cookieParser());
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json())
app.use(express.static('public'));

app.use(
  citystate,
  simpleCurd,
  deliSearch,
  dymcGrid,
  fetchapi_task,
  exammaster,
  ajaxcurd,
  attedancemaster,
  clockconvertor
);

//middlewares
app.set("view engine", "ejs");
// app.use(userdetail);

app.get("/", (req, res) => {
  console.log("/get");
  res.render("login");
});

const executeQuery = (sql) => {
  return new Promise((resolve, reject) => {
    connection.query(sql, (err, result) => {
      if (err) return reject(err);
      return resolve(result);
    });
  });
};

app.post("/register", async (req, res) => {
  console.log("in post");
  return new Promise(async (resolve, reject) => {
    var body = req.body;
    console.log(body);
    // validate user input
    if (!body) {
      res.status(400).send("All input is required");
    }

    // check if user already exists
    // var existssql = `select * from users where first_name = '${body.firstname}' and email = '${body.email}';`;
    // connection.query(existssql, (err, result1) => {
    //   console.log(typeof result1);
    //     if (Object.keys(result1).length > 0) {
    //       res.send("Invalid information");
    //     }
    // });

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

app.get("/data", verifyToken, async (req, res) => {
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

app.post("/data", verifyToken, async (req, res) => {
  var data = req.body;
  console.log("in data");
  var sql2 = `select * from users where id = '${data.id}';`;
  var result2 = await executeQuery(sql2);
  console.log(sql2, result2);
});

// app.get("/login", (req, res) => {
//   console.log("in login get");
//   res.render("login");
// });

app.get("/register", (req, res) => {
  res.render("registration");
});

app.post("/login", async (req, res) => {
  console.log("in login post ");
  var data = req.body.email;
  console.log(data);
  // res.status(200).json({ message: "Protected route accessed" });

  if (data.email && data.password) {
    var sql = `select count(*) as counter from users where email = '${data.email}';`;
    var result = await executeQuery(sql);
    if (result[0].counter == 1) {
      var salt = `select * from users where email = '${data.email}';`;
      var result2 = await executeQuery(salt);
      var password = data.password;
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
        var token = jwt.sign({ id: id }, "PARAM");
        console.log("password match");
        console.log("token is  " + token);
        res
          .cookie(
            "token",
            token,
            { httpOnly: true, sameSite: "Strict" },
            { expiresIn: "180s" }
          )
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

app.get("/forgotpass", (req, res) => {
  res.render("email");
});

app.post("/getemail", verifyToken, async (req, res) => {
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
  console.log(sql, result);
  res.send({ code: code });
  // 1.generate 12 digits connected
  // 2. get the email from body
  // 3. write a quiery for update and update the activation code and created time current time stamp default
});

app.get("/checkemail/:email", verifyToken, async (req, res) => {
  console.log("email exists or not");
  var email = req.params.email;
  console.log(email);
  var sql = `select count(*) as counter from users where email='${email}';`;
  var result = await executeQuery(sql);
  var exists = result[0].counter >= 1;
  console.log(exists);
  res.send(exists);
});

app.get("/forgotpass2", verifyToken, async (req, res) => {
  var token = req.query.code;
  q = `select id from users where token='${token}';`;
  var result = await executeQuery(q);
  res.render("forgotpass", { id: result[0].id });
});

app.post("/newpass", verifyToken, async (req, res) => {
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

app.get("/home", verifyToken, (req, res) => {
  res.render("home");
});

app.get("/dynamictable", verifyToken, (req, res) => {
  res.render("dynamic");
});

app.get("/kukucube", verifyToken, (req, res) => {
  res.render("kukucube");
});

app.get("/tictactoe", verifyToken, (req, res) => {
  res.render("tictactoe");
});
app.get("/eventtable", verifyToken, (req, res) => {
  res.render("eventtable");
});
app.get("/sorting", verifyToken, (req, res) => {
  res.render("sorting");
});
app.get("/appliform", verifyToken, (req, res) => {
  res.render("Job_applcation");
});

app.get("/ehya", verifyToken, (req, res) => {
  res.sendFile(path.join(__dirname, "public/ehya/ehya.html"));
});

app.get("/awanhoster", verifyToken, (req, res) => {
  res.sendFile(path.join(__dirname, "public/awanhoster/index.html"));
});

app.get("/hirex", verifyToken, (req, res) => {
  res.sendFile(path.join(__dirname, "public/hirex/index.html"));
});

app.get("/ehya", verifyToken, (req, res) => {
  res.sendFile(path.join(__dirname, "public/ehya/ehya.html"));
});

app.get("/success", verifyToken, (req, res) => {
  res.render("success");
});

app.get("/fail", verifyToken, (req, res) => {
  res.render("faild");
});

app.get("/logout", (req, res) => {
  console.log("log out");
  const sessionCookie = req.cookies.token;
  console.log("cookie from browser: " + sessionCookie);
  res.clearCookie("token").redirect("/");
});
app.listen(PORT, (err) => {
  if (err) {
    throw err;
  } else console.log(`Server is runnig http://${hostName}:${PORT}`);
});
