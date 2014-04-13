# grunt-wrap-commonjs

Wraps .coffee and .js files into CommonJS modules for client-side usage.

## Getting Started
Install this grunt plugin next to your project's [grunt.js gruntfile][getting_started] with: ``npm install grunt-wrap-commonjs --save-dev``

Then add this line to your project's ``Gruntfile.coffee``:

```coffeescript
grunt.loadNpmTasks 'grunt-wrap-commonjs'
```

[grunt]: https://github.com/gruntjs/grunt
[getting_started]: https://github.com/gruntjs/grunt/wiki/Getting-started

### CommonJS Require

You need a `require.register` function in the scope where you add the wrapped files. It's recommended to use [commonjs-require](https://github.com/efacilitation/commonjs-require) for this purpose.


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

MIT

Copyright (c) 2013-2014 [efa GmbH](https://github.com/efacilitation)
Copyright (c) 2012-2013 Christopher Rogers, [Team Delicious, AVOS Systems Inc., Derek Petersen](https://github.com/tuxracer/grunt-commonjs-coffee)