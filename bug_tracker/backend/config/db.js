import mongoose from "mongoose";

const connection = mongoose
  .createConnection("mongodb://localhost:27017/bug-tracker")
  .on("open", () => {
    console.log("MongoDb Connected");
  })
  .on("error", () => {
    console.log("MongoDb connection error");
  });

export default connection;
