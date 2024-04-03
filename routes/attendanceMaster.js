const express = require("express");
const router = express.Router();

const attattedance  = require("../controller/attendanceMaster");
const verifyToken = require("../middleware/authMiddleware");

router.get("/allattendance", verifyToken, attattedance);

module.exports = router;
