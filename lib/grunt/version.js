"use strict";

// Required node modules
var fs = require("fs");
var path = require("path");

module.exports = fs.readFileSync(path.join(__dirname, "..", "..", "VERSION")).toString().trim();
