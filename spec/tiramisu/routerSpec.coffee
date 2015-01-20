DescribedClass = require 'tiramisu/router'

describe "Tiramisu.Router", ->
  jet 'router', -> new DescribedClass()

  beforeEach ->
    Backbone.history.stop()

  it "route '' delegates to Home.Controller#landing with $('body') element", ->
    el = $('body')
    spyOn(Tiramisu.Home.Controller, 'landing')
    _navigate('')
    expect(Tiramisu.Home.Controller.landing).toHaveBeenCalledWith(el)

  it "route 'dashboard' delegates to Home.Controller#dashboard with $('body') element", ->
    el = $('body')
    spyOn(Tiramisu.Home.Controller, 'dashboard')
    _navigate('dashboard')
    expect(Tiramisu.Home.Controller.dashboard).toHaveBeenCalledWith(el)


  it "redirects to '' when route is unknown", ->
    spyOn(router, 'navigate')
    _navigate('/foo-bar')
    expect(router.navigate).toHaveBeenCalledWith('', {trigger: true})

_navigate = (route) ->
  Backbone.history.start()
  Backbone.history.navigate(route, {trigger: true})
  Backbone.history.stop()
