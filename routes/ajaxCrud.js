const express = require("express");
const router = express.Router();

const { ajax, ajaxData, ajaxPost } = require("../controller/ajaxCrud");
const verifyToken = require("../middleware/authMiddleware");

router.get("/ajax",verifyToken, ajax);
router.post("/ajax", verifyToken, ajaxPost);
router.get("/ajax/data", verifyToken, ajaxData);

module.exports = router;
