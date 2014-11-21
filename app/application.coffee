require 'configs/namespace'
require 'tiramisu/router'

module.exports =
  class Application
    constructor: ->
      @router = new Tiramisu.Router()

    init: ->
      Backbone.history.start({pushState:true})

window.Application = Application
