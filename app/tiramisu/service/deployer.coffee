require 'tiramisu/service/apiClient'

module.exports =
  class Tiramisu.Service.Deployer
    constructor: (@model) ->

    apiClient: new Tiramisu.Service.APIClient()

    deploy: ->
      @apiClient.deploy(@model.get("id"))

    healthCheck: ->
      @apiClient.healthCheck(@model.get("id"))
