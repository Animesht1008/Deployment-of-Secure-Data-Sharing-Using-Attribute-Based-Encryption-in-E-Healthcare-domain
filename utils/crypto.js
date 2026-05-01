const crypto = require("crypto");

function normalizedMasterKey() {
  const master = process.env.MASTER_KEY || "default-master-key-change-me";
  return crypto.createHash("sha256").update(master).digest();
}

function encryptText(plainText) {
  const dataKey = crypto.randomBytes(32);
  const dataIv = crypto.randomBytes(12);
  const dataCipher = crypto.createCipheriv("aes-256-gcm", dataKey, dataIv);
  const encrypted = Buffer.concat([dataCipher.update(plainText, "utf8"), dataCipher.final()]);
  const dataTag = dataCipher.getAuthTag();

  const wrapIv = crypto.randomBytes(12);
  const wrapper = crypto.createCipheriv("aes-256-gcm", normalizedMasterKey(), wrapIv);
  const wrapped = Buffer.concat([wrapper.update(dataKey), wrapper.final()]);
  const wrapTag = wrapper.getAuthTag();

  return {
    encryptedData: encrypted.toString("base64"),
    dataIv: dataIv.toString("base64"),
    dataTag: dataTag.toString("base64"),
    wrappedKey: wrapped.toString("base64"),
    wrapIv: wrapIv.toString("base64"),
    wrapTag: wrapTag.toString("base64")
  };
}

function decryptText(record) {
  const unwrap = crypto.createDecipheriv(
    "aes-256-gcm",
    normalizedMasterKey(),
    Buffer.from(record.wrapIv, "base64")
  );
  unwrap.setAuthTag(Buffer.from(record.wrapTag, "base64"));
  const dataKey = Buffer.concat([
    unwrap.update(Buffer.from(record.wrappedKey, "base64")),
    unwrap.final()
  ]);

  const decipher = crypto.createDecipheriv("aes-256-gcm", dataKey, Buffer.from(record.dataIv, "base64"));
  decipher.setAuthTag(Buffer.from(record.dataTag, "base64"));
  return Buffer.concat([
    decipher.update(Buffer.from(record.encryptedData, "base64")),
    decipher.final()
  ]).toString("utf8");
}

function generateAccessKey() {
  return `F${Math.floor(10000 + Math.random() * 90000)}`;
}

module.exports = { encryptText, decryptText, generateAccessKey };
