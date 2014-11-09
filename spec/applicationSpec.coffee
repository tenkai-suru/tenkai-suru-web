DescribedClass = require 'application'

describe 'Application', ->
  beforeEach ->
    spyOn(Backbone.history, 'start').and.returnValue(null)

  it 'creates the application with a router', ->
    describedClass = new DescribedClass()
    expect(describedClass.router).not.toBe(undefined)

  it 'starts history with push state', ->
    describedClass = new DescribedClass()
    describedClass.init()
    expect(Backbone.history.start).toHaveBeenCalledWith({pushState: true})
