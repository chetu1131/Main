const jwt = require("jsonwebtoken");
require("cookie-parser");
var secret_key = process.env.SECRET_KEY;

function verifyToken(req, res, next) {
  console.log("in middle ware");
  var token = req.cookies.auth;
  // console.log(req);
  // console.log("token in middleware " + token);

  if (!token) return res.redirect("/");
  if (token) {
    const user = jwt.verify(token, secret_key);
    // console.log("hello " + user.id);
    req.userId = user.id;
    next();
  } else {
    res.status(401).json({ error: "Invalid token" });
  }
}

module.exports = verifyToken;
