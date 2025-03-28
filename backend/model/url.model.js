const mongoose = require('mongoose')
const db = new mongoose.Schema({
    title: {
        type: String,
        required: true
    },
    originalUrl: { type: String, required: true },
    shortId: { type: String, required: true, unique: true },
    createdAt: { type: Date, default: Date.now },
    visitehistory: [{
        timestamps: { type: Number },
        ipAddress: { type: String },
        userAgent: { type: String },
    }
    ],
    createdBy: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Users"
    }

},
    {
        timestamps: true
    }
)

module.exports = mongoose.model("Url", db);
