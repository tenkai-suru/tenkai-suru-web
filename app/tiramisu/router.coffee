HomeController = require 'tiramisu/home/controller'

module.exports =
  class Tiramisu.Router extends Backbone.Router
    routes:
      ''          : -> HomeController.signup($('body'))
      'dashboard' : -> HomeController.index($('body'))
      '*all'      : -> @navigate('', {trigger: true})
