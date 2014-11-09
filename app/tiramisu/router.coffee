HomeController = require 'tiramisu/home/controller'

module.exports =
  class Tiramisu.Router extends Backbone.Router
    routes:
      ''      : -> HomeController.index($('body'))
      '*all'  : -> @navigate('')
