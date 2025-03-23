const mongoose = require("mongoose")

const db = mongoose.connect('mongodb://127.0.0.1:27017/shortQr', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
}).then(() => console.log("MongoDB Connected ✅")).catch((err) => console.error("MongoDB Connection Error:", err));


module.exports = db;