const express = require("express");
const multer = require("multer");
const { requireRole } = require("../middleware/auth");
const FileRecord = require("../models/FileRecord");
const AccessRequest = require("../models/AccessRequest");
const { encryptText } = require("../utils/crypto");

const router = express.Router();
const upload = multer({ storage: multer.memoryStorage() });

router.use(requireRole("patient"));

router.get("/dashboard", async (req, res) => {
  const files = await FileRecord.find({ patient: req.session.user.id }).sort({ createdAt: -1 });
  const requests = await AccessRequest.find({ patient: req.session.user.id }).populate("doctor file").sort({ createdAt: -1 });
  res.render("patient-dashboard", { files, requests });
});

router.post("/upload", upload.single("file"), async (req, res) => {
  if (!req.file) return res.render("message", { title: "Upload failed", message: "File is required." });

  const encrypted = encryptText(req.file.buffer.toString("utf8"));
  await FileRecord.create({
    patient: req.session.user.id,
    patientName: req.session.user.name,
    filename: req.file.originalname,
    mimeType: req.file.mimetype || "text/plain",
    ...encrypted,
    accessKey: `F${Math.floor(10000 + Math.random() * 90000)}`,
    department: req.body.department,
    age: req.body.age,
    bloodGroup: req.body.bloodGroup,
    heartRate: req.body.heartRate,
    height: req.body.height,
    weight: req.body.weight,
    bloodPressure: req.body.bloodPressure,
    bloodSugar: req.body.bloodSugar
  });

  res.redirect("/patient/dashboard");
});

router.post("/requests/:id/approve", async (req, res) => {
  await AccessRequest.updateOne({ _id: req.params.id, patient: req.session.user.id }, { status: "approved" });
  res.redirect("/patient/dashboard");
});

router.post("/requests/:id/reject", async (req, res) => {
  await AccessRequest.updateOne({ _id: req.params.id, patient: req.session.user.id }, { status: "rejected" });
  res.redirect("/patient/dashboard");
});

module.exports = router;
