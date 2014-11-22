module.exports =
  class Tiramisu.Deploy.Client
    baseURL: "http://whateverdavetellsme"

    deploy: (appId, callback, failback) ->
      $.ajax
        url: "#{@baseURL}/v1/projects/#{appId}/deploy"
        type: "POST"
        success: callback
        error: failback

    healthCheck: (appId, callback, failback) ->
      $.ajax
        url: "#{@baseURL}/v1/projects/#{appId}/healthcheck"
        type: "GET"
        success: callback
        error: failback
