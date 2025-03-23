const express = require("express");
const app = express();
const db = require("./config/db")
const route = require("./routes/route")
app.use(express.json())
app.use(express.urlencoded({ extended: true }));

app.use("/api", route);
app.get('/', (req, res) => {
    res.send('Hello World!')
})



app.listen(3000, (req, res) => {
    console.log(`server started ✅`)
})