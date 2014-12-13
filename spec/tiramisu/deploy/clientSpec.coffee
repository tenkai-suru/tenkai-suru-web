DescribedClass = require 'tiramisu/deploy/client'

describe 'Tiramisu.Deploy.Client', ->
  jet 'client', -> new DescribedClass()
  beforeEach ->
    spyOn($, 'ajax')

  describe '#deploy', ->
    it 'makes an async call to the external resource', ->
      ajaxParams =
        url: "#{client.baseURL}/v1/project/1/deploy"
        type: "POST"
        success: "callback"
        error: "failback"
      client.deploy(1, "callback", "failback")
      expect($.ajax).toHaveBeenCalledWith(ajaxParams)

  describe '#healthCheck', ->
    it 'makes an async call to the external resource', ->
      ajaxParams =
        url: "#{client.baseURL}/v1/project/1/healthcheck"
        type: "GET"
        success: "callback"
        error: "failback"
      client.healthCheck(1, "callback", "failback")
      expect($.ajax).toHaveBeenCalledWith(ajaxParams)
