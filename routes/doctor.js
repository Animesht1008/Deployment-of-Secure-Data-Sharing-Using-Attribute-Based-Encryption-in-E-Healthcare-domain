const express = require("express");
const { requireRole } = require("../middleware/auth");
const FileRecord = require("../models/FileRecord");
const AccessRequest = require("../models/AccessRequest");
const { decryptText } = require("../utils/crypto");

const router = express.Router();
router.use(requireRole("doctor"));

router.get("/dashboard", async (req, res) => {
  const query = { department: req.session.user.department };
  if (req.query.patientName) {
    query.patientName = { $regex: req.query.patientName, $options: "i" };
  }

  const files = await FileRecord.find(query).sort({ createdAt: -1 });
  const requests = await AccessRequest.find({ doctor: req.session.user.id }).populate("file").sort({ createdAt: -1 });
  res.render("doctor-dashboard", { files, requests, patientName: req.query.patientName || "" });
});

router.post("/request/:fileId", async (req, res) => {
  const file = await FileRecord.findById(req.params.fileId);
  if (!file) return res.render("message", { title: "Not found", message: "File not found." });

  await AccessRequest.updateOne(
    { file: file._id, doctor: req.session.user.id },
    { $setOnInsert: { file: file._id, doctor: req.session.user.id, patient: file.patient, status: "waiting" } },
    { upsert: true }
  );
  res.redirect("/doctor/dashboard");
});

router.get("/download/:requestId", async (req, res) => {
  const request = await AccessRequest.findOne({ _id: req.params.requestId, doctor: req.session.user.id }).populate("file");
  if (!request) return res.render("message", { title: "Not found", message: "Request not found." });
  if (request.status !== "approved") return res.render("message", { title: "Denied", message: "Request not approved yet." });

  if (req.query.key !== request.file.accessKey) {
    return res.render("message", { title: "Invalid key", message: "Access key is incorrect." });
  }

  const plain = decryptText(request.file);
  res.setHeader("Content-Disposition", `attachment; filename="${request.file.filename}"`);
  res.type("text/plain").send(plain);
});

module.exports = router;
