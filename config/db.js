const mongoose = require("mongoose");

async function connectDB() {
  const isProd = process.env.NODE_ENV === "production";
  const uri = isProd ? process.env.MONGODB_URI_PROD : process.env.MONGODB_URI_LOCAL || process.env.MONGODB_URI;

  if (!uri) {
    throw new Error("MongoDB URI is missing. Set MONGODB_URI_LOCAL for localhost and MONGODB_URI_PROD for production.");
  }

  await mongoose.connect(uri, {
    serverSelectionTimeoutMS: 10000
  });
  console.log(`MongoDB connected (${isProd ? "production" : "local"})`);
}

module.exports = connectDB;
