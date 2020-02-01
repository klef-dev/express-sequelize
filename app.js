const express = require("express");
const exhbs = require("express-handlebars");
const path = require("path");
const port = process.env.PORT || 3000;

const db = require("./config/database");

db.authenticate()
  .then(() => {
    console.log("Database Connected...");
  })
  .catch(err => {
    console.log(err);
  });

const app = express();

app.engine("handlebars", exhbs({ defaultLayout: "main" }));
app.set("view engine", "handlebars");

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use("/api/users", require("./routes/api/users"));
app.use("/api/tutorials", require("./routes/api/tutorials"));
app.use("/api/articles", require("./routes/api/articles"));
app.use("/", require("./routes/api/home"));

app.use(express.static(path.join(__dirname, "public")));

app.listen(port, () => {
  console.log(`Your app is being served on http://127.0.0.1:${port}`);
});
