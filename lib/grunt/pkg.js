"use strict";

// Required files
var version = require("./version");

function loadPkg(grunt) {
  var pkg = grunt.file.readJSON("package.json");
  pkg.version = version;
  return pkg;
}

module.exports = loadPkg;
