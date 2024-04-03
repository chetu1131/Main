const express = require("express");
const router = express.Router();

const { grid, postQuery ,getQuery} = require("../controller/dynamicGrid");
const verifyToken = require("../middleware/authMiddleware");

router.get("/grid", verifyToken, grid);
router.post("/query", verifyToken, postQuery);
router.get("/query", verifyToken, getQuery);

module.exports = router;
