const express = require("express");
const app = express();

// Settings
app.set("appName", "Sistema Integral de Gestión de Viáticos");
app.set("port", 3000);
//app.set("view engine", "");

app.get("/src/", () =>
{
  res.send("DELETE request received");
}
);

//app.use(express.static("public"));

app.listen(app.get("port"), () => {
  console.log(`${app.get("appName")} on port: ${app.get("port")}`);
});