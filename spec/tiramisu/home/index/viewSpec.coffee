require 'tiramisu/home/index/view'

describe 'Tiramisu.Home.Index.View', ->
  jet 'attrs', ->  { deployLink: 'http://www.google.com', health: 'down' }
  jet 'model', -> new Backbone.Model(attrs)
  jet 'view', -> new Tiramisu.Home.Index.View(model)

  beforeEach ->
    spyOn(view.deployer, 'deploy')

  describe '#supply', ->
    it 'renders and returns the composed template', ->
      expected = (require 'tiramisu/home/index/template')({app: attrs})
      el = view.supply()
      expect(expected).toEqual(el.html())

  describe '#events', ->
    it 'click [data-id="deployButton"] executes deployer#deploy', ->
      view.render()
      view.$el.find('.deployButton').click()
      expect(view.deployer.deploy).toHaveBeenCalled()
