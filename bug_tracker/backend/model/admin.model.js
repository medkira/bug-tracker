import mongoose from "mongoose";
import db from "../config/db.js";
import bcrypt from "bcrypt";

const { Schema } = mongoose;

const adminSchema = new Schema({
  name: {
    type: String,
    required: true,
    unique: true,
  },
  email: {
    type: String,
    lowercase: true,
    required: true,
    unique: true,
  },
  password: {
    type: String,
    required: true,
  },
});

adminSchema.pre("save", async function () {
  try {
    var user = this;
    const salt = await bcrypt.genSalt(10);
    const hashpass = await bcrypt.hash(user.password, salt);
  } catch (err) {
    throw err;
  }
});

adminSchema.methods.comparePassword = async function () {
  try {
    const isMatch = await bcrypt.compare(userPassword, this.password);

    return isMatch;
  } catch (err) {
    throw err;
  }
};

const AdminModel = db.model("Admin", adminSchema);

export default AdminModel;
