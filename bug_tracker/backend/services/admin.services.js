import AdminModel from "../model/admin.model.js";
import jwt from "jsonwebtoken";

class AdminService {
  static async registerAdmin(name, email, password) {
    try {
      const createAdmin = new AdminModel({ name, email, password });
      return await createAdmin.save();
    } catch (err) {
      throw err;
    }
  }

  static async checkAdmin(email) {
    try {
      const admin = await AdminModel.findOne({ email });
      return admin;
    } catch (err) {
      throw err;
    }
  }

  static async generateToken(tokenData, secretKey, jwt_expire) {
    return jwt.sign(tokenData, secretKey, { expiresIn: jwt_expire });
  }
}

export default AdminService;
