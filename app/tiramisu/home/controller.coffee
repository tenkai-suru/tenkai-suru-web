module.exports =
  Tiramisu.Home.Controller =
    _index: require 'tiramisu/home/index/view'

    index: (el) ->
      view = new @_index(@dummyApp)
      el.append view.supply()

    dummyApp:
      new Backbone.Model({
        deployLink: 'http://whateverdavetellsme/v1/project/id/deploy'
        healthCheckLink: 'http://whateverdavetellsme/v1/project/id/healthCheck'
        health: 'up'
      })
