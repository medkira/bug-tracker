import DeveloperService from "../services/developer.services.js";

export const register = async (req, res, next) => {
  try {
    const { email, password } = req.body;

    const successRes = await DeveloperService.registerDeveloper(
      email,
      password
    );
    res.status(200).json("user has been created");
  } catch (err) {
    throw err;
  }
};

export const login = async (req, res, next) => {
  try {
    const { email, password } = req.body;

    const developer = await DeveloperService.checkdeveloper(email);
    const isMatch = await developer.comparePassword(password);
    if (developer && isMatch) {
      let tokenData = { _id: developer._id, email: developer.email };

      const token = await DeveloperService.generateToken(
        tokenData,
        "secret",
        "1h"
      );
      res.status(200).json({ status: true, token: token });
    } else {
      res.status(401);
      throw new Error("Invalid email or password");
    }
  } catch (err) {
    next(err);
  }
};
