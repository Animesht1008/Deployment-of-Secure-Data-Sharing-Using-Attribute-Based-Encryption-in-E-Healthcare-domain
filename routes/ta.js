const express = require("express");
const { requireRole } = require("../middleware/auth");
const User = require("../models/User");
const AccessRequest = require("../models/AccessRequest");

const router = express.Router();
router.use(requireRole("ta"));

router.get("/dashboard", async (req, res) => {
  const pendingDoctors = await User.find({ role: "doctor", approved: false }).sort({ createdAt: -1 });
  const waitingRequests = await AccessRequest.find({ status: "waiting" }).populate("doctor patient file").sort({ createdAt: -1 });
  res.render("ta-dashboard", { pendingDoctors, waitingRequests });
});

router.post("/doctor/:id/approve", async (req, res) => {
  await User.updateOne({ _id: req.params.id, role: "doctor" }, { approved: true });
  res.redirect("/ta/dashboard");
});

router.post("/request/:id/approve", async (req, res) => {
  await AccessRequest.updateOne({ _id: req.params.id }, { status: "approved" });
  res.redirect("/ta/dashboard");
});

router.post("/request/:id/reject", async (req, res) => {
  await AccessRequest.updateOne({ _id: req.params.id }, { status: "rejected" });
  res.redirect("/ta/dashboard");
});

module.exports = router;
