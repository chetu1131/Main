const express = require("express");
const router = express.Router();

const { cityState, getCity } = require("../controller/cityState");
const verifyToken = require("../middleware/authMiddleware");

router.get("/citystate", verifyToken, cityState);
router.get("/citystate/getcities/:id",verifyToken, getCity);

module.exports = router;
