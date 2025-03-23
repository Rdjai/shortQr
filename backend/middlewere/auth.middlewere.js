const userModel = require("../model/user.model");
const { getUser } = require("../service/jwt")
const HandleRestricUser = async (req, res, next) => {
    try {
        const authHeader = req.headers.authorization;
        const userId = authHeader.split(" ")[1];
        console.log(userId);
        if (!userId) return res.status(401).json({
            error: "please login and try again",
        })
        const id = getUser(userId);


        const decodeAuth = await userModel.findOne({
            "email": id.email
        });
        console.log(decodeAuth, "decode aurh ");
        if (!id) return res.status(401).json({
            error: "please login and try again",
        })

        req.user = decodeAuth;
        next();
    } catch (error) {
        console.error("Error in HandleRestricUser:", error);
        res.status(401).json({ error: "Unauthorized: Invalid token" });
    }
}

module.exports = {
    HandleRestricUser
}