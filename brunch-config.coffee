exports.config =
  # See http://brunch.io/#documentation for docs.
  paths:
    watched: ['configs', 'app', 'test']

   plugins:
     sass:
       mode: 'native'

  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^(app|configs)/
        'javascripts/vendor.js': /^bower_components/

    stylesheets:
      joinTo:
        'stylesheets/app.css': /^(app|vendor|bower_components)/

    templates:
      joinTo: 'javascripts/app.js'
