module.exports =
  Tiramisu.Home.Controller =
    _dashboard: require 'tiramisu/home/dashboard/view'
    _signup:    require 'tiramisu/home/signup/view'

    dashboard: (el) ->
      view = new @_dashboard(@_dummyApp)
      el.append view.supply()

    landing: (el) ->
      view = new @_signup()
      el.append view.supply()

    _dummyApp:
      new Backbone.Model({
        id: 1
        health: "up"
      })
