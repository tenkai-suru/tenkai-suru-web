require 'tiramisu/deploy/client'

module.exports =
  class Tiramisu.Deploy.Service
    apiClient: new Tiramisu.Deploy.Client()
    constructor: (@model) ->

    deploy: ->
      @apiClient.deploy(@model.get("id"))

    healthCheck: ->
      @apiClient.healthCheck(@model.get("id"))
