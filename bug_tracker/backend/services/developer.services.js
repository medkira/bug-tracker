import DeveloperModel from "../model/developer.model.js";
import jwt from "jsonwebtoken";

class DeveloperService {
  static async registerDeveloper(email, password) {
    try {
      const createDeveloper = new DeveloperModel({ email, password });

      return await createDeveloper.save();
    } catch (err) {
      throw err;
    }
  }

  static async checkdeveloper(email) {
    try {
      const developer = await DeveloperModel.findOne({ email });

      return developer;
    } catch (err) {
      throw err;
    }
  }

  static async generateToken(tokenData, secretKey, jwt_expire) {
    return jwt.sign(tokenData, secretKey, { expiresIn: jwt_expire });
  }
}

export default DeveloperService;
