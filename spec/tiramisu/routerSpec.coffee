DescribedClass = require 'tiramisu/router'

describe "Tiramisu.Router", ->
  jet 'router', -> new DescribedClass()

  beforeEach ->
    Backbone.history.stop()

  it "route 'dashboard' delegates to Home.Controller#index with $('body') element", ->
    el = $('body')
    spyOn(Tiramisu.Home.Controller, 'index')
    _navigate('dashboard')
    expect(Tiramisu.Home.Controller.index).toHaveBeenCalledWith(el)

  it "route '' delegates to Home.Controller#signup with $('body') element", ->
    el = $('body')
    spyOn(Tiramisu.Home.Controller, 'signup')
    _navigate('')
    expect(Tiramisu.Home.Controller.signup).toHaveBeenCalledWith(el)

  it "redirects to '' when route is unknown", ->
    spyOn(router, 'navigate')
    _navigate('/foo-bar')
    expect(router.navigate).toHaveBeenCalledWith('', {trigger: true})

_navigate = (route) ->
  Backbone.history.start()
  Backbone.history.navigate(route, {trigger: true})
  Backbone.history.stop()
