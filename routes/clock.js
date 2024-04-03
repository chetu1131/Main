const express = require("express");
const router = express.Router();

const clock = require("../controller/clock");
const verifyToken = require("../middleware/authMiddleware");

router.get("/clock", verifyToken, clock);

module.exports = router;
