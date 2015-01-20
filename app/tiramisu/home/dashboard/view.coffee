require 'tiramisu/deploy/deployService'

module.exports =
  class Tiramisu.Home.Dashboard.View extends Backbone.View
    template: require 'tiramisu/home/dashboard/template'

    constructor: (@model) ->
      super()
      @init()

    events:
      'click [data-id="deployButton"]' : -> @deployer.deploy()

    render: ->
      @$el.html @template({app: @model.attributes})

    init: ->
      @model.on('change', @render, @)
      @deployer = new Tiramisu.Deploy.DeployService(@model)

    supply: ->
      @render()
      @$el
