const express = require("express");
const router = express.Router();

const { user, userAlldetails } = require("../controller/fetchAApi");
const verifyToken = require("../middleware/authMiddleware");

router.get("/user", verifyToken, user);
router.get("/user/alldetails", verifyToken, userAlldetails);

module.exports = router;
