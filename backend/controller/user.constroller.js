const userModel = require("../model/user.model");
const User = require("../model/user.model");
const { setUser } = require("../service/jwt");
const registerHandler = async (req, res) => {
    try {
        const Udata = req.body;
        const userExists = await User.findOne(Udata);
        if (userExists) {
            return res.status(400).json({ error: "User already exists" });
        }
        const user = new User(Udata);
        await user.save();
        res.status(201).json({ message: "User registered successfully", user });
    } catch (err) {
        console.error("Error during registration:", err);
        res.status(500).json({ error: "Internal server error" });
    }
};


const loginHandler = async (req, res) => {
    try {
        const { email, password } = req.body;
        const userdata = await User.findOne({ email });
        if (userdata && userdata.password === password) {
            const sesstionId = setUser(userdata.email, userdata.password);
            res.json({

                "sessionId": sesstionId,
                _id: userdata._id,
                name: userdata.Name,
                email: userdata.email,

            });
        } else {
            res.status(401).json({ error: "Invalid email or password" });
        }


    } catch (error) {
        console.error("Error during login:", error);
        res.status(500).json({ error: "Internal server error" });
    }
}

async function profileHandle(req, res) {
    const id = req.user._id;
    try {
        if (!id) return res.status(201).json({
            status: false,
            error: "something went wrong please login"
        })
        const data = await userModel.find(id);
        // console.log(data);
        if (!data) return res.status(201).json({
            status: false,
            error: "please login or something went wrong"
        })
        res.status(200).json({
            status: true,
            data
        })
    } catch (error) {
        console.error("Error during login:", error);
        res.status(500).json({ error: "Internal server error" });
    }


}
module.exports = {
    registerHandler,
    loginHandler,
    profileHandle
}