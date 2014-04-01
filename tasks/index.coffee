###
grunt-contrib-commonjs
https://github.com/johannesbecker/grunt-contrib-commonjs

Copyright (c) 2013 Team Delicious, AVOS Systems Inc.
Licensed under the MIT license.
###

path = require 'path'
grunt = require 'grunt'

indentStr = (str) ->
  str.replace(/(\r\n|\n|\r)/g, '\n  ')

isCoffeeScript = (filepath) ->
  filepath.slice(-7) is '.coffee'

wrapDefine = (filepath, content, options) ->
  definePath = filepath.replace /\.\w+$/, ''
  if options.pathReplace typeof 'function'
    definePath = options.pathReplace definePath

  if isCoffeeScript filepath
    content = indentStr content
    "window.require.register '#{definePath}': (exports, require, module) ->\n  #{content}\n"
  else
    "window.require.register({'#{definePath}': function(exports, require, module) {#{content}}});\n"

module.exports = (grunt) ->
  grunt.registerMultiTask 'commonjs', 'Wrap .coffee and .js files for commonjs.', ->

    options = @options(
      pathReplace: false
    )

    @filesSrc.forEach (filepath) =>
      content = grunt.file.read path.join @data.cwd, filepath
      dest = path.join @data.dest, filepath

      if options.pathReplace typeof 'function'
        filepath = options.pathReplace filepath

      wrapped = wrapDefine filepath, content, options

      grunt.file.write dest, wrapped
