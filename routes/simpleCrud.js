const express = require("express");
const router = express.Router();

const {
  student,
  postStudent,
  getStudent,
  updateStudent,
} = require("../controller/simpleCrud");
const verifyToken = require("../middleware/authMiddleware");

router.get("/student", verifyToken, student);
router.post("/student", verifyToken, postStudent);
router.get("/student/:id", verifyToken, getStudent);
router.post("/student/id", verifyToken, updateStudent);

module.exports = router;
