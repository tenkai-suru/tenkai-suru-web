module.exports =
  class Tiramisu.Service.APIClient
    baseURL: "http://whateverdavetellsme"

    deploy: (appId) ->
      $.ajax
        url: "#{@baseURL}/v1/projects/#{appId}/deploy"
        type: "POST"

    healthCheck: (appId) ->
      $.ajax
        url: "#{@baseURL}/v1/projects/#{appId}/healthcheck"
        type: "GET"

