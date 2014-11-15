DescribedClass = require 'tiramisu/service/apiClient'

describe 'Tiramisu.Service.APIClient', ->
  describe '#deploy', ->
    it 'makes an async call to the external resource', ->
      client = new DescribedClass()
      ajaxParams =
        url: "#{client.baseURL}/v1/projects/1/deploy"
        type: "POST"
      spyOn($, 'ajax')
      client.deploy(1)
      expect($.ajax).toHaveBeenCalledWith(ajaxParams)

  describe '#healthCheck', ->
    it 'makes an async call to the external resource', ->
      client = new DescribedClass()
      ajaxParams =
        url: "#{client.baseURL}/v1/projects/1/healthcheck"
        type: "GET"
      spyOn($, 'ajax')
      client.healthCheck(1)
      expect($.ajax).toHaveBeenCalledWith(ajaxParams)
