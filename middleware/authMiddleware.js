const jwt = require("jsonwebtoken");
require("cookie-parser");
function verifyToken(req, res, next) {
  var token = req.cookies.token;
  console.log(req);
  console.log(token);
  if (!token) return res.status(401).json({ error: "Access denied" });
  try {
    const decoded = jwt.verify(token, process.env.SECRET_KEY);
    req.userId = decoded.id;
    next();
  } catch (error) {
    res.status(401).json({ error: "Invalid token" });
  }
}

module.exports = verifyToken;