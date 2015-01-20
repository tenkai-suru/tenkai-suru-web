HomeController = require 'tiramisu/home/controller'

module.exports =
  class Tiramisu.Router extends Backbone.Router
    routes:
      ''          : -> HomeController.landing($('body'))
      'dashboard' : -> HomeController.dashboard($('body'))
      '*all'      : -> @navigate('', {trigger: true})
