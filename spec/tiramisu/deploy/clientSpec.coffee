DescribedClass = require 'tiramisu/deploy/client'

describe 'Tiramisu.Deploy.Client', ->
  beforeEach ->
    spyOn($, 'ajax')

  describe '#deploy', ->
    it 'makes an async post to the external resource', ->
      ajaxParams =
        url: "#{DescribedClass.baseURL}/v1/project/1/deploy"
        type: "POST"
        success: "callback"
        error: "failback"
      DescribedClass.deploy(1, "callback", "failback")
      expect($.ajax).toHaveBeenCalledWith(ajaxParams)

  describe '#healthCheck', ->
    it 'makes an async get to the external resource', ->
      ajaxParams =
        url: "#{DescribedClass.baseURL}/v1/project/1/healthcheck"
        type: "GET"
        success: "callback"
        error: "failback"
      DescribedClass.healthCheck(1, "callback", "failback")
      expect($.ajax).toHaveBeenCalledWith(ajaxParams)

  describe '#signup', ->
    it 'makes an async post to the external resource', ->
      ajaxParams =
        url: "#{DescribedClass.baseURL}/v1/signup"
        data: {}
        type: "POST"
        success: "callback"
        error: "failback"
      DescribedClass.signup({}, "callback", "failback")
      expect($.ajax).toHaveBeenCalledWith(ajaxParams)
