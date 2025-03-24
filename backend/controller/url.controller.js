const express = require("express");
const QRCode = require('qrcode')

const shortid = require("shortid");
const UrlModel = require("../model/url.model");
const urlModel = require("../model/url.model");

const shortUrlHandler = async (req, res) => {
    const { originalUrl } = req.body;

    console.log("Received URL:", originalUrl);

    try {
        if (!originalUrl) {
            return res.status(400).json({ error: "Original URL is required" });
        }

        const shortId = shortid.generate();
        console.log("Generated Short ID:", shortId);
        if (!shortId) {
            return res.status(500).json({ error: "Failed to generate a shortId" });
        }

        const existingUrl = await UrlModel.findOne({ shortId });
        if (existingUrl) {
            return res.status(200).json({
                status: true,
                message: "URL already shortened",
                shortUri: `${req.protocol}://${req.get("host")}/api/v1/${existingUrl.shortId}`
            });
        }

        const newUrl = new UrlModel({
            originalUrl,
            shortId,
            createdBy: req.user._id
        });

        await newUrl.save();
        const qrCodeUri = `${req.protocol}://${req.get("host")}/api/v1/${shortId}`
        QRCode.toDataURL(qrCodeUri, function (err, qrCode) {
            if (err) {
                return res.status(500).json({ error: "Failed to generate QR code" });
            }
            res.status(200).json({
                status: true,
                message: "URL shortened successfully",
                shortUri: `${req.protocol}://${req.get("host")}/api/v1/${shortId}`,
                qrCode
            });
        })


    } catch (error) {
        console.error("Error in shortUrlHandler:", error);
        res.status(500).json({ error: error.message || "Server error" });
    }
};



//all url

const myurlsHandler = async (req, res) => {
    try {
        const userId = req.user._id;
        if (!userId) {
            return res.status(400).json({ status: false, msg: "User ID is required" });
        }
        const data = await UrlModel.find({ createdBy: userId });
        if (!data || data.length === 0) {
            return res.status(404).json({ status: false, msg: "No URLs found" });
        }
        res.status(200).json({ status: true, msg: "Fetched all URLs", data });
    } catch (error) {
        console.error("Error in myurlsHandler:", error);
        res.status(500).json({ error: "Server error", details: error.message });
    }
};


//redirect 
const redirectHandler = async (req, res) => {
    const { shortId } = req.params;
    try {
        const url = await UrlModel.findOne({ shortId });

        if (!url) {
            return res.status(404).json({ error: "URL not found" });
        }
        let finalUrl = url.originalUrl;
        if (!/^https?:\/\//i.test(finalUrl)) {
            finalUrl = `https://${finalUrl}`;
        }
        url.visitehistory.push({
            timestamps: Date.now(),
            ipAddress: req.ip,
            userAgent: req.get("User-Agent"),
        });
        await url.save();
        console.log("Redirecting to:", finalUrl);
        return res.redirect(finalUrl);
    } catch (error) {
        console.error("Error during URL redirection:", error);
        res.status(500).json({ error: "Internal server error" });
    }
};


const visitehistoryHandle = async (req, res) => {
    try {
        const shortid = req.body;
        console.log(shortid.shortid);

        const data = await UrlModel.findOne(shortid);
        if (data === null) return res.status(400).json({
            error: "url not exits"
        })
        return res.status(200).json({
            view: data.visitehistory.length,
            analytics: data.visitehistory
        })
    } catch (error) {
        console.error("Error during URL redirection:", error);
        res.status(500).json({ error: "Internal server error" });
    }
}


//costum short uri
async function constumShortUriHandler(req, res) {
    const { originalUrl, costum_uri } = req.body;
    try {
        if (!originalUrl && !costum_uri) {
            if (!originalUrl) return res.status(201).json({
                status: false,
                error: "please add Url you want to short",
            })
            else {
                return res.status(201).json({
                    status: false,
                    error: "please add Alias you want to short",
                })
            }
        }

        const shortId = costum_uri.split(" ").join("_")
        const alias = await urlModel.findOne({
            shortId: shortId
        });


        console.log("here is the alias ", alias);
        if (alias === null) {
            const newUrl = new UrlModel({
                originalUrl,
                shortId,
                createdBy: req.user._id
            });

            await newUrl.save();
        }
        else {
            return res.status(200).json({
                status: true,
                error: "Alias already used please use somthing unique",
            })
        }
        res.status(200).json({
            status: true,
            message: "URL shortened successfully",
            shortUri: `${req.protocol}://${req.get("host")}/api/v1/${shortId}`
        });
    } catch (error) {
        console.error("Error during URL redirection:", error);
        res.status(500).json({ error: "Internal server error" });
    }

}

//delete short uri
async function deleteUriHandler(req, res) {
    const { shortId } = req.body;
    console.log(shortId, "here is short id");
    try {
        if (!shortId) return res.status(201).json({
            status: false,
            error: "please add short Id",
        })
        const data = await urlModel.findOneAndDelete({
            shortId: shortId
        });
        if (data === null) return res.status(201).json({
            status: false,
            error: "url not found"
        })
        console.log("mongoFetch data", data);
        res.status(200).json({
            status: true,
            msg: "Uri found and deleted",
            data
        })
    } catch (error) {
        console.error("Error during URL redirection:", error);
        res.status(500).json({ error: "Internal server error" });
    }
}

//qr code generator

const qrCodeGeneratorHandle = async (req, res) => {

    try {
        const { shortId } = req.body;
        if (!shortId) return res.status(400).json({
            error: "url not exits"
        })
        const uri = await urlModel.find({
            shortId: shortId
        })
        console.log("uri for qr", uri);
        const data = uri[0].originalUrl;
        console.log("originalUrl for qr", data);
        if (uri === null) return res.status(400).json({
            error: "url not exits"
        })

        QRCode.toDataURL(data, function (err, qrCode) {
            if (err) {
                return res.status(500).json({ error: "Failed to generate QR code" });
            }
            res.status(200).json({
                status: true,
                message: "URL Qr code successfully",
                shortUri: `${req.protocol}://${req.get("host")}/api/v1/${shortId}`,
                qrCode
            });
        })

    } catch (error) {
        console.error("Error during URL redirection:", error);
        res.status(500).json({ error: "Internal server error" });
    }
}

// async function uriUpdateHandler(req, res) {
//     const { shortId, Alias, originalUrl } = req.body;
//     const data = Alias.split(" ").join("_")
//     const AliasCheck = await urlModel.find({
//         shortId: AliasCheck
//     });
//     if (!AliasCheck) return res.status(201).json({
//         status: false,
//         error
//     })
//     if (AliasCheck === null && shortId != null) {

//         const updateUri = await urlModel.findOneAndUpdate(
//             {
//                 shortId: data
//             },
//             {
//                 shortId: data
//             }
//         );

//     } else {
//         const data = await urlModel.findOneAndUpdate(
//             {
//                 shortId: shortId
//             },
//             {
//                 shortId: data
//             }
//         );
//     }
// }

module.exports = {
    shortUrlHandler,
    redirectHandler,
    myurlsHandler,
    visitehistoryHandle,
    constumShortUriHandler,
    deleteUriHandler,
    qrCodeGeneratorHandle
}