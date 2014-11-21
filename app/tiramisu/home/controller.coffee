module.exports =
  Tiramisu.Home.Controller =
    _index: require 'tiramisu/home/index/view'

    index: (el) ->
      view = new @_index(@_dummyApp)
      el.append view.supply()

    _dummyApp:
      new Backbone.Model({
        id: "id"
        health: "up"
      })
