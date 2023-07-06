import connection from "./config/db.js";
import express from "express";
import bodyParser from "body-parser";
import developerRouters from "./routers/developer.router.js";
import adminRouter from "./routers/admin.router.js";
import { Server } from "socket.io";
import http from "http";

const port = 3000;
const app = express();

const server = http.createServer(app);

const io = new Server(server);

app.use(bodyParser.json());
app.use("/user", developerRouters);
app.use("/admin", adminRouter);

// io.on("connection", (client) => {
//   console.log("new client connected");
//   console.log(client.id);
// });

io.on("connection", (socket) => {
  console.log("A user connected");

  socket.on("disconnect", () => {
    console.log("A user disconnected");
  });

  socket.on("chat message", (message) => {
    console.log("Recived mesage:", message), io.emit("chat message", message);
  });
});

server.listen(port, () => {
  console.log("server connected");
});
