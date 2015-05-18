"use strict";

var loadTasks = require("load-grunt-tasks");

module.exports = function (grunt) {
  loadTasks(grunt);

  grunt.initConfig({
    "clean": require("./lib/grunt/clean"),
    "pkg": require("./lib/grunt/pkg")(grunt),
    "shell": require("./lib/grunt/shell")
  });

  grunt.registerTask("deploy", "Deploy the website", [
    "shell:syncVersion",
    "clean:out",
    "shell:docpadDeploy"
  ]);
};
