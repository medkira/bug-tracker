import mongoose from "mongoose";
import db from "../config/db.js";

const { Schema } = mongoose;

const taskSchema = new Schema({
  description: String,
  assignedTo: {
    type: Schema.Types.ObjectId,
    ref: "user",
  },
  status: String,
  deadline: Date,
});

const groupSchema = new Schema({
  name: String,
  tasks: [taskSchema],
});

const boardSchema = new Schema({
  name: String,
  groups: [groupSchema],
});

const projectSchema = new Schema({
  name: String,
  description: String,
  startDate: Date,
  endDate: Date,

  adminId: {
    type: Schema.Types.ObjectId,
    ref: "admin",
  },

  teamMembers: [
    {
      type: Schema.Types.ObjectId,
      ref: "user",
    },
  ],
  boards: [boardSchema],
});

const ProjectModel = db.model("Project", projectSchema);

export default ProjectModel;
