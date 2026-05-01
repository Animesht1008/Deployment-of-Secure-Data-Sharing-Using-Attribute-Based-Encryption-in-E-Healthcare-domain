const express = require("express");
const bcrypt = require("bcryptjs");
const User = require("../models/User");

const router = express.Router();

router.get("/", (req, res) => {
  res.render("index");
});

router.get("/signup/:role", (req, res) => {
  const role = req.params.role;
  if (!["patient", "doctor"].includes(role)) return res.redirect("/");
  res.render("signup", { role });
});

router.post("/signup/:role", async (req, res) => {
  const role = req.params.role;
  if (!["patient", "doctor"].includes(role)) return res.redirect("/");

  const { name, email, password, dob, age, gender, phone, address, department } = req.body;
  const existing = await User.findOne({ email: email.toLowerCase() });
  if (existing) return res.render("message", { title: "User exists", message: "Email already registered." });

  const passwordHash = await bcrypt.hash(password, 10);
  await User.create({
    role,
    name,
    email: email.toLowerCase(),
    passwordHash,
    dob,
    age,
    gender,
    phone,
    address,
    department: role === "doctor" ? department : undefined,
    approved: role === "patient"
  });
  res.render("message", {
    title: "Signup success",
    message: role === "doctor" ? "Doctor registered. Wait for TA approval." : "Patient registered. Please login."
  });
});

router.get("/login/:role", (req, res) => {
  const role = req.params.role;
  if (!["patient", "doctor", "ta", "cloud"].includes(role)) return res.redirect("/");
  res.render("login", { role });
});

router.post("/login/patient", async (req, res) => {
  const { email, password } = req.body;
  const user = await User.findOne({ email: email.toLowerCase(), role: "patient" });
  if (!user || !(await bcrypt.compare(password, user.passwordHash))) {
    return res.render("message", { title: "Login failed", message: "Invalid patient credentials." });
  }
  req.session.user = { id: user._id.toString(), role: user.role, name: user.name, email: user.email };
  res.redirect("/patient/dashboard");
});

router.post("/login/doctor", async (req, res) => {
  const { email, password } = req.body;
  const user = await User.findOne({ email: email.toLowerCase(), role: "doctor" });
  if (!user || !(await bcrypt.compare(password, user.passwordHash))) {
    return res.render("message", { title: "Login failed", message: "Invalid doctor credentials." });
  }
  if (!user.approved) {
    return res.render("message", { title: "Not approved", message: "Doctor account is pending TA approval." });
  }
  req.session.user = { id: user._id.toString(), role: user.role, name: user.name, email: user.email, department: user.department };
  res.redirect("/doctor/dashboard");
});

router.post("/login/ta", (req, res) => {
  const { email, password } = req.body;
  if (email === process.env.TA_EMAIL && password === process.env.TA_PASSWORD) {
    req.session.user = { id: "ta", role: "ta", name: "Trusted Authority", email };
    return res.redirect("/ta/dashboard");
  }
  return res.render("message", { title: "Login failed", message: "Invalid TA credentials." });
});

router.post("/login/cloud", (req, res) => {
  const { email, password } = req.body;
  if (email === process.env.CLOUD_EMAIL && password === process.env.CLOUD_PASSWORD) {
    req.session.user = { id: "cloud", role: "cloud", name: "Cloud Admin", email };
    return res.redirect("/cloud/dashboard");
  }
  return res.render("message", { title: "Login failed", message: "Invalid cloud credentials." });
});

router.get("/logout", (req, res) => {
  req.session.destroy(() => res.redirect("/"));
});

module.exports = router;
