const mongoose = require("mongoose");

const accessRequestSchema = new mongoose.Schema(
  {
    file: { type: mongoose.Schema.Types.ObjectId, ref: "FileRecord", required: true },
    doctor: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
    patient: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
    status: {
      type: String,
      enum: ["waiting", "approved", "rejected"],
      default: "waiting"
    },
    note: String
  },
  { timestamps: true }
);

accessRequestSchema.index({ file: 1, doctor: 1 }, { unique: true });

module.exports = mongoose.model("AccessRequest", accessRequestSchema);
