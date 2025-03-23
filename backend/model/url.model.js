const mongoose = require('mongoose')
const db = new mongoose.Schema({
    originalUrl: { type: String, required: true },
    shortId: { type: String, required: true, unique: true },
    createdAt: { type: Date, default: Date.now },
    visitehistory: [{
        timestamps: { type: Number }, // Unix timestamp
        ipAddress: { type: String }, // User's IP address
        userAgent: { type: String }, // User's browser user-agent
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
