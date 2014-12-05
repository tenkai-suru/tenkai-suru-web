module.exports =
  class Tiramisu.Deploy.Client
    baseURL: "https://tenkai-suru-api.herokuapp.com"

    deploy: (appId, callback, failback) ->
      $.ajax
        url: "#{@baseURL}/v1/project/#{appId}/deploy"
        type: "POST"
        success: callback
        error: failback

    healthCheck: (appId, callback, failback) ->
      $.ajax
        url: "#{@baseURL}/v1/project/#{appId}/healthcheck"
        type: "GET"
        success: callback
        error: failback
