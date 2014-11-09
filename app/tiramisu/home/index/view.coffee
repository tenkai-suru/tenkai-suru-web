require 'tiramisu/service/deployer'

module.exports =
  class Tiramisu.Home.Index.View extends Backbone.View
    template: require 'tiramisu/home/index/template'

    constructor: (@model) ->
      super()
      @init()

    events:
      'click [data-id="deployButton"]' : -> @deployer.deploy()

    render: ->
      @$el.html @template({app: @model.attributes})

    init: ->
      @model.on('change', @render, @)
      @deployer = new Tiramisu.Service.Deployer(@model)

    supply: ->
      @render()
      @$el
