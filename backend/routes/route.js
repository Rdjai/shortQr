const express = require("express");
const route = express.Router();


const { HandleRestricUser } = require("../middlewere/auth.middlewere")
const { registerHandler, loginHandler, profileHandle } = require("../controller/user.constroller")
const { shortUrlHandler, redirectHandler, myurlsHandler, constumShortUriHandler, visitehistoryHandle, deleteUriHandler } = require("../controller/url.controller")


//user routes
route.post("/register", registerHandler);
route.post("/login", loginHandler);
route.get('/profile', HandleRestricUser, profileHandle);

//URL Shortening & Management
route.post("/shorturi", HandleRestricUser, shortUrlHandler);
route.post("/Alias", HandleRestricUser, constumShortUriHandler);
route.post("/delete", HandleRestricUser, deleteUriHandler)

route.get("/details/:shortId", redirectHandler);
route.get("/my-url", HandleRestricUser, myurlsHandler);
route.get("/analytics/visitors", HandleRestricUser, visitehistoryHandle)

// route.put("/update/:shortId", HandleRestricUser, )


module.exports = route;