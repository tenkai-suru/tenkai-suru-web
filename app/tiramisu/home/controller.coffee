module.exports =
  Tiramisu.Home.Controller =
    _index: require 'tiramisu/home/index/view'

    index: (el) ->
      view = new @_index(@dummyApp)
      el.append view.supply()

    dummyApp:
      new Backbone.Model({
        id: "id"
        health: "up"
      })
