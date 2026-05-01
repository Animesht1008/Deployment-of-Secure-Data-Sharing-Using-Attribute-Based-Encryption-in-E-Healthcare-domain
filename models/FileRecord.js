const mongoose = require("mongoose");

const fileRecordSchema = new mongoose.Schema(
  {
    patient: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
    patientName: { type: String, required: true },
    filename: { type: String, required: true },
    mimeType: { type: String, required: true },
    encryptedData: { type: String, required: true },
    dataIv: { type: String, required: true },
    dataTag: { type: String, required: true },
    wrappedKey: { type: String, required: true },
    wrapIv: { type: String, required: true },
    wrapTag: { type: String, required: true },
    accessKey: { type: String, required: true },
    department: String,
    age: String,
    bloodGroup: String,
    heartRate: String,
    height: String,
    weight: String,
    bloodPressure: String,
    bloodSugar: String
  },
  { timestamps: true }
);

module.exports = mongoose.model("FileRecord", fileRecordSchema);
