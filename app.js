require("dotenv").config();

const express = require("express");
const path = require("path");
const session = require("express-session");
const MongoStore = require("connect-mongo").default;
const methodOverride = require("method-override");
const helmet = require("helmet");
const morgan = require("morgan");
const cookieParser = require("cookie-parser");
const compression = require("compression");
const rateLimit = require("express-rate-limit");
const connectDB = require("./config/db");

const authRoutes = require("./routes/auth");
const patientRoutes = require("./routes/patient");
const doctorRoutes = require("./routes/doctor");
const taRoutes = require("./routes/ta");
const cloudRoutes = require("./routes/cloud");

const app = express();
const isProd = process.env.NODE_ENV === "production";
const port = Number(process.env.PORT || 3000);

if (isProd) {
  app.set("trust proxy", 1);
}

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));
app.disable("x-powered-by");

app.use(
  helmet({
    contentSecurityPolicy: false,
    crossOriginResourcePolicy: { policy: "cross-origin" }
  })
);
app.use(compression());
app.use(morgan(isProd ? "combined" : "dev"));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(cookieParser());
app.use(methodOverride("_method"));
app.use(express.static(path.join(__dirname, "public")));
app.use(
  rateLimit({
    windowMs: 15 * 60 * 1000,
    max: isProd ? 400 : 2000,
    standardHeaders: true,
    legacyHeaders: false
  })
);

app.use(
  session({
    secret: process.env.SESSION_SECRET || "dev-secret",
    resave: false,
    saveUninitialized: false,
    proxy: isProd,
    store: MongoStore.create({
      mongoUrl: isProd ? process.env.MONGODB_URI_PROD : process.env.MONGODB_URI_LOCAL || process.env.MONGODB_URI,
      ttl: 60 * 60 * 6
    }),
    cookie: {
      httpOnly: true,
      sameSite: isProd ? "none" : "lax",
      secure: isProd,
      maxAge: 1000 * 60 * 60 * 6
    }
  })
);

app.use((req, res, next) => {
  res.locals.currentUser = req.session.user || null;
  next();
});

app.use("/", authRoutes);
app.use("/patient", patientRoutes);
app.use("/doctor", doctorRoutes);
app.use("/ta", taRoutes);
app.use("/cloud", cloudRoutes);
app.get("/healthz", (req, res) => res.status(200).json({ ok: true }));

app.use((req, res) => {
  res.status(404).render("message", { title: "Not found", message: "The page you requested does not exist." });
});

app.use((err, req, res, next) => {
  console.error(err);
  res.status(500).render("message", { title: "Server error", message: "Something went wrong. Check server logs." });
});

connectDB()
  .then(() => {
    app.listen(port, () => {
      console.log(`Server running on port ${port} (${isProd ? "production" : "local"})`);
    });
  })
  .catch((err) => {
    console.error("Failed to start server:", err.message);
    process.exit(1);
  });
