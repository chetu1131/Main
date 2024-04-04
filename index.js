require("dotenv").config();
const express = require("express");
const cors = require("cors");
const app = express();
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const path = require("path");
const PORT = process.env.PORT || 8000;
const hostName = "localhost";

const regiLogin = require("./controller/regiLogin.js");
const verifyToken = require("./middleware/authMiddleware.js");
const deliSearch = require("./routes/delimeterSearch.js");
const dymcGrid = require("./routes/dynamicGrid.js");
const fetchapiTask = require("./routes/fetchApi.js");
const cityState = require("./routes/cityState.js");
const simpleCrud = require("./routes/simpleCrud.js");
const examMaster = require("./routes/examMaster.js");
const attedanceMaster = require("./routes/attendanceMaster.js");
const ajaxCrud = require("./routes/ajaxCrud.js");
const clockConvertor = require("./routes/clock.js");

app.use(cookieParser());
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json());
app.use(express.static("public"));

app.use(ajaxCrud);
app.use(regiLogin);
app.use(cityState);
app.use(simpleCrud);
app.use(examMaster);
app.use(deliSearch);
app.use(dymcGrid);
app.use(fetchapiTask);
app.use(attedanceMaster);
app.use(clockConvertor);
//middlewares
app.set("view engine", "ejs");
// app.use(userdetail);

app.get("/home", verifyToken, (req, res) => {
  res.render("home");
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

app.get("/success", verifyToken, (req, res) => {
  res.sendFile(path.join(__dirname, "public/success.html"));
});

app.get("/fail", verifyToken, (req, res) => {
  res.sendFile(path.join(__dirname, "public/faild.html"));
});

app.get("*", (req, res) => {
  res.status(404).send("<h1>404! Page not found</h1>");
});

app.listen(PORT, (err) => {
  if (err) {
    throw err;
  } else console.log(`Server is runnig http://${hostName}:${PORT}`);
});
