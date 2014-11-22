DescribedClass = require 'application'

describe 'Application', ->
  jet 'application', -> new DescribedClass()

  beforeEach ->
    spyOn(Backbone.history, 'start').and.returnValue(null)

  it 'creates the application with a router', ->
    expect(application.router).not.toBe(undefined)

  it 'starts history with push state', ->
    application.init()
    expect(Backbone.history.start).toHaveBeenCalledWith({pushState: true})
