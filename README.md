# grunt-contrib-commonjs

Wraps .coffee and .js files into CommonJS modules for client-side usage.

## Getting Started
Install this grunt plugin next to your project's [grunt.js gruntfile][getting_started] with: ``npm install grunt-contrib-commonjs --save-dev``

Then add this line to your project's ``Gruntfile.coffee``:

```coffeescript
grunt.loadNpmTasks 'grunt-contrib-commonjs'
```

###CommonJS loader
You'll need a loader to detect your wrapped packages. You can use this simple [CommonJS loader](https://github.com/chrisabrams/commonjs) which is based off how [brunch.io](http://brunch.io) loads CommonJS packages.

[grunt]: https://github.com/gruntjs/grunt
[getting_started]: https://github.com/gruntjs/grunt/wiki/Getting-started

## Documentation
Configure which files to be copied in your `initConfig`:

```coffeescript
grunt.initConfig

  # ... other configs

  # wrap my modules with define
  commonjs:
    modules:
      cwd: 'assets/'
      src: ['**/*.coffee', '**/*.js']
      dest: 'dist/'

  # ... other configs
```

## Configuration

`pathReplace` Allows you to set filterer function for module names, for example, change all app/file to file. Default: false

```coffeescript
  pathReplace: (path) ->
    path.replace(/^app\//, '')
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [grunt][grunt].

## License
Copyright (c) 2012 [Team Delicious, AVOS Systems Inc., Derek Petersen](https://github.com/tuxracer/grunt-commonjs-coffee)

Licensed under the MIT license.
