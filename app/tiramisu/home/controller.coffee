module.exports =
  Tiramisu.Home.Controller =
    _index:   require 'tiramisu/home/index/view'
    _signup:  require 'tiramisu/home/signup/view'

    index: (el) ->
      view = new @_index(@_dummyApp)
      el.append view.supply()

    signup: (el) ->
      view = new @_signup()
      el.append view.supply()

    _dummyApp:
      new Backbone.Model({
        id: 1
        health: "up"
      })
