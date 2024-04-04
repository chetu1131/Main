// require("dotenv").config();
// const express = require("express");
// const cors = require("cors");
// const app = express();
// var bodyParser = require("body-parser");
// const cookieParser = require("cookie-parser");
// const path = require("path");
// const router = express.Router();
// const regiLogin = require("../controller/regiLogin");
// const verifyToken = require("../middleware/authMiddleware");
// const deliSearch = require("../routes/delisearch");
// const dymcGrid = require("../routes/dynamicgrid");
// const fetchapi_task = require("../routes/fetchapi");
// const citystate = require("../routes/citystate");
// const simpleCurd = require("../routes/simplecurd");
// const exammaster = require("../routes/exammaster");
// const attedancemaster = require("../routes/attendancemaster");
// const ajaxcurdRoute = require("../routes/ajaxcurd");
// const clockconvertor = require("../routes/clock");

// app.use(cookieParser());
// app.use(cors());
// app.use(bodyParser.urlencoded({ extended: true }));
// app.use(express.json());
// app.use(express.static("public"));

// app.use(
//   ajaxcurdRoute,
//   regiLogin,
//   citystate,
//   simpleCurd,
//   deliSearch,
//   dymcGrid,
//   fetchapi_task,
//   exammaster,
//   attedancemaster,
//   clockconvertor
// );

// //middlewares
// app.set("view engine", "ejs");
// // app.use(userdetail);

// app.get("/home", verifyToken, (req, res) => {
//   res.render("home");
// });

// app.get("/ehya", verifyToken, (req, res) => {
//   res.sendFile(path.join(__dirname, "public/ehya/ehya.html"));
// });

// app.get("/awanhoster", verifyToken, (req, res) => {
//   res.sendFile(path.join(__dirname, "public/awanhoster/index.html"));
// });

// app.get("/hirex", verifyToken, (req, res) => {
//   res.sendFile(path.join(__dirname, "public/hirex/index.html"));
// });

// app.get("/success", verifyToken, (req, res) => {
//   res.sendFile(path.join(__dirname, "public/success.html"));
// });

// app.get("/fail", verifyToken, (req, res) => {
//   res.sendFile(path.join(__dirname, "public/faild.html"));
// });
