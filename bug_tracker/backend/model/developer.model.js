import mongoose from "mongoose";
import db from "../config/db.js";
import bcrypt from "bcrypt";

const { Schema } = mongoose;

const developerSchema = new Schema({
  name: {
    type: String,
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

developerSchema.pre("save", async function () {
  try {
    var user = this;
    const salt = await bcrypt.genSalt(10);
    const hashpass = await bcrypt.hash(user.password, salt);

    user.password = hashpass;
  } catch (err) {
    throw err;
  }
});

developerSchema.methods.comparePassword = async function (userPassword) {
  try {
    const isMatch = await bcrypt.compare(userPassword, this.password);

    return isMatch;
  } catch (err) {
    throw err;
  }
};

const DeveloperModel = db.model("developer", developerSchema);

export default DeveloperModel;
