const jwt = require("jsonwebtoken")
const key = "rdj@123";
function setUser(email, pass) {
    return jwt.sign({
        email: email,
        password: pass
    }, key);
}

function getUser(token) {
    try {
        return jwt.verify(token, key);
    } catch (error) {
        console.error("Invalid token:", error.message);
        return null; // Return null instead of throwing an error
    }
}

module.exports = {
    setUser,
    getUser
}