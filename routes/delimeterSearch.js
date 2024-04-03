const express = require("express");
const router = express.Router();

const { delimeter, postDelimeter } = require("../controller/delimeterSearch");
const verifyToken = require("../middleware/authMiddleware");

router.get("/delimeter", verifyToken, delimeter);
router.post("/delimeter",verifyToken, postDelimeter);

module.exports = router;
