DescribedClass = require 'tiramisu/deploy/client'

describe 'Tiramisu.Deploy.Client', ->
  describe '#deploy', ->
    it 'makes an async call to the external resource', ->
      client = new DescribedClass()
      ajaxParams =
        url: "#{client.baseURL}/v1/projects/1/deploy"
        type: "POST"
        success: "callback"
        error: "failback"
      spyOn($, 'ajax')
      client.deploy(1, "callback", "failback")
      expect($.ajax).toHaveBeenCalledWith(ajaxParams)

  describe '#healthCheck', ->
    it 'makes an async call to the external resource', ->
      client = new DescribedClass()
      ajaxParams =
        url: "#{client.baseURL}/v1/projects/1/healthcheck"
        type: "GET"
        success: "callback"
        error: "failback"
      spyOn($, 'ajax')
      client.healthCheck(1, "callback", "failback")
      expect($.ajax).toHaveBeenCalledWith(ajaxParams)
