const jwt = require("jsonwebtoken");
require("cookie-parser");
var secret_key = process.env.SECRET_KEY || "";

function verifyToken(req, res, next) {
  var token = req.cookies.auth;
  if (!token) return res.redirect("/");
  if (token) {
    const user = jwt.verify(token, secret_key);
    req.userId = user.id;
    next();
  } else {
    res.status(401).json({ error: "Invalid token" });
  }
}

module.exports = verifyToken;
