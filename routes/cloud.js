const express = require("express");
const { requireRole } = require("../middleware/auth");
const FileRecord = require("../models/FileRecord");

const router = express.Router();
router.use(requireRole("cloud"));

router.get("/dashboard", async (req, res) => {
  const files = await FileRecord.find().sort({ createdAt: -1 }).limit(200);
  res.render("cloud-dashboard", { files });
});

module.exports = router;
