require 'tiramisu/deploy/client'

module.exports =
  class Tiramisu.Deploy.Service
    apiClient: new Tiramisu.Deploy.Client()
    constructor: (@model) ->

    deploy: ->
      @apiClient.deploy(@model.get("id"), @pollHealthCheck)

    pollHealthCheck: (response) ->
      if response.healthy
        @model.set({health : "up"})
      else
        @model.set({health: "down"})
        setTimeout(@repollHealthCheck, 5000)

    repollHealthCheck: ->
      @healthCheck(@pollHealthCheck)

    healthCheck: (callback) ->
      @apiClient.healthCheck(@model.get("id"), callback)
