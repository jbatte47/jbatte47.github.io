"use strict";

// Required files
var version = require("./version");

/**
 * Provides the configuration object used in the grunt-shell task.
 * @type {Object}
 */
module.exports = {
  syncVersion: {
    command: "npm --no-git-tag-version version " + version,
    options: {
      failOnError: false,
      stderr: false
    }
  },
  docpadDeploy: {
    command: "docpad deploy-ghpages --env static"
  }
};
