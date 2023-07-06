import AdminService from "../services/admin.services.js";

export const register = async (req, res, next) => {
  try {
    const { name, email, password } = req.body;
    const successRes = await AdminService.registerAdmin(name, email, password);
    res.status(200).json("user has been created");
  } catch (err) {
    throw err;
  }
};

export const login = async (req, res, next) => {
  try {
    const { email, password } = req.body;
    const admin = await AdminService.checkAdmin(email);

    const isMatch = await admin.comparePassword(password);
    if (admin && isMatch) {
      let tokenData = { _id: admin._id, email: admin.email };
      const token = await AdminService.generateToken(tokenData, "secret", "1h");
      res.status(200).json({ status: true, token: token });
    } else {
      res.status(401);
      throw new Error("Invalide email or password");
    }
  } catch (err) {
    next(err);
  }
};
