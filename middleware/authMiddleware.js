const jwt = require("jsonwebtoken");
require("cookie-parser");

function verifyToken(req, res, next) {
  console.log("in middle ware");
  var token = req.cookies.token;
  console.log("token in middleware " + token);

  if (!token)
    return res.redirect("/login").status(401).json({ error: "Access denied" });
  if (token) {
    const user = jwt.verify(token, "PARAM");
    req.userId = user.id;
    next();
  } else {
    res.status(401).json({ error: "Invalid token" });
  }
}

module.exports = verifyToken;
